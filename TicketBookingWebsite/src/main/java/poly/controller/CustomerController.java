package poly.controller;

import java.io.File;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import admin.controller.Message;
import poly.entity.ChiTietGhePhong;
import poly.entity.LichChieu;
import poly.entity.Phim;
import poly.entity.TaiKhoan;
import poly.entity.Ve;

import externalFunc.func;

@Transactional
@Controller
@RequestMapping("/customer")
public class CustomerController {
	@Autowired
	SessionFactory factory;

	@Autowired
	ServletContext context;

	public List<Ve> layLVKH(Integer maKH) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Ve where maKH = :maKH";
		Query query = session.createQuery(hql);
		query.setParameter("maKH", maKH);
		List<Ve> list = query.list();
		for (Ve ve : list) {
			System.out.println(ve.getMaVe());
		}
		return list;
	}

	@RequestMapping("/account.htm")
	public String account(ModelMap model, HttpServletRequest request, HttpSession ss) {
		model.addAttribute("user", LoginController.kh);
		model.addAttribute("tk", LoginController.taikhoan);
		List<Ve> listVe = layLVKH(LoginController.kh.getMaKH());
		System.out.println(listVe.size());
		System.out.println(LoginController.kh.getVeList().size());
		System.out.println("hihi");
		model.addAttribute("lv", listVe);
		System.out.println(LoginController.kh.getVeList().size());
		if (LoginController.matKhau.equals("01234567") == true) {
			model.addAttribute("message", "Nhớ thay đổi mật khẩu mới!");
		}
		model.addAttribute("login", true);
		return "customer/account";
	}

	@RequestMapping(value = "/update/{id}.htm", method = RequestMethod.POST)
	public String edit(ModelMap model, @RequestParam("tenKH") String tenKH, @RequestParam("gioiTinh") boolean gioiTinh,
			@RequestParam("soDT") String soDT, @RequestParam("ngaySinh") String ngaySinh,
			@RequestParam("diaChi") String diaChi, @RequestParam("photo") MultipartFile photo,
			@PathVariable("id") Integer maKH, RedirectAttributes redirectAttributes) throws ParseException {

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
		Date ngaySinhDate = formatter.parse(ngaySinh);

		boolean valid = true;
		if (tenKH.trim().isEmpty()) {
			model.addAttribute("errors_tenKH", "Tên khách hàng không được để trống!");
			valid = false;
		}
		if (soDT.trim().isEmpty()) {
			model.addAttribute("errors_soDT", "Số điện thoại không được để trống!");
			valid = false;
		}
		if (ngaySinhDate == null) {
			model.addAttribute("errors_ngaySinh", "Ngày sinh không được để trống!");
			valid = false;
		}
		if (diaChi.trim().isEmpty()) {
			model.addAttribute("errors_diaChi", "Địa chỉ không được để trống!");
			valid = false;
		}
		if (!valid) {
			redirectAttributes.addFlashAttribute("message", new Message("error", "Cập nhật thất bại!"));
			return "redirect:/customer/account.htm";
		}

		String photoPath = null;
		if (photo.isEmpty()) {
			model.addAttribute("message", "Vui lòng chọn file !");
		} else {
			try {
				photoPath = context.getRealPath("/uploads/" + photo.getOriginalFilename());
				photo.transferTo(new File(photoPath));
				System.out.println("Đường dẫn: " + photoPath);
				redirectAttributes.addFlashAttribute("photo_name", photo.getOriginalFilename());
			} catch (Exception e) {
				model.addAttribute("message", "Lỗi lưu file");
				return "customer/account";
			}
		}

		// Cập nhật thông tin cá nhân
		Session session = factory.getCurrentSession();
		String hql = "UPDATE KhachHang SET TenKH = :tenKH, GioiTinh = :gioiTinh, SDT = :soDT, NgaySinh = :ngaySinhDate, DiaChi = :diaChi";
		if (photoPath != null) {
			hql += ", Avatar = :avatar";
		}
		hql += " WHERE MaKH = :maKH";

		Query query = session.createQuery(hql);
		query.setParameter("tenKH", tenKH.trim());
		query.setParameter("gioiTinh", gioiTinh);
		query.setParameter("ngaySinhDate", ngaySinhDate);
		query.setParameter("soDT", soDT.trim());
		query.setParameter("diaChi", diaChi.trim());
		query.setParameter("maKH", maKH);
		if (photoPath != null) {
			query.setParameter("avatar", photo.getOriginalFilename());
		}

		int affectedRows = query.executeUpdate();

		// Cập nhật đối tượng user trong session (nếu cần)
		LoginController.kh.setTenKH(tenKH.trim());
		LoginController.kh.setGioiTinh(gioiTinh);
		LoginController.kh.setNgaySinh(ngaySinhDate);
		LoginController.kh.setSoDT(soDT.trim());
		LoginController.kh.setDiaChi(diaChi.trim());
		if (photoPath != null) {
			LoginController.kh.setAvatar(photo.getOriginalFilename());
		}

		redirectAttributes.addFlashAttribute("message", new Message("success", "Cập nhật thành công!"));
		return "redirect:/customer/account.htm";
	}

	public void doDL(ModelMap model) {
		model.addAttribute("user", LoginController.kh);
		model.addAttribute("tk", LoginController.taikhoan);
	}

	@RequestMapping(value = "/change/password", method = RequestMethod.POST)
	public String updatePass(ModelMap model, HttpSession ss, HttpServletRequest request,
			RedirectAttributes redirectAttributes) throws NoSuchAlgorithmException {
		String oldPass = request.getParameter("oldPass");
		String newPass = request.getParameter("newPass");
		String cfnewPass = request.getParameter("confirmPass");
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(oldPass.trim().getBytes());
		byte[] digest = md.digest();
		String myHash = func.bytesToHex(digest).toLowerCase();
		TaiKhoan a = LoginController.taikhoan;
		if (newPass.toString().trim().length() > 8) {
			model.addAttribute("message", "Mật khẩu mới không được quá 8 ký tự!");
			doDL(model);
			redirectAttributes.addFlashAttribute("message",
					new Message("error", "Mật khẩu mới không được quá 8 ký tự!"));
			return "redirect:/customer/account.htm";
		}
		if (oldPass.equals(LoginController.matKhau)) {
			if (newPass.equals(cfnewPass)) {
				MessageDigest md1 = MessageDigest.getInstance("MD5");
				md1.update(newPass.trim().getBytes());
				byte[] digest1 = md1.digest();
				String myHash1 = func.bytesToHex(digest1).toLowerCase();
				a.setPassword(myHash1);
			} else {
				model.addAttribute("message", "Mật khẩu xác nhận không giống nhau!");
				doDL(model);
				model.addAttribute("login", true);
				redirectAttributes.addFlashAttribute("message",
						new Message("error", "Mật khẩu xác nhận không giống nhau!"));
				return "redirect:/customer/account.htm";
			}
			if (newPass.equals("01234567") == true) {
				model.addAttribute("message", "Không được sử dụng mật khẩu này!");
				doDL(model);
				model.addAttribute("login", true);
				redirectAttributes.addFlashAttribute("message", new Message("error", "Sai mật khẩu cũ"));
				return "redirect:/customer/account.htm";

			}
		} else {
			model.addAttribute("message", "Sai mật khẩu cũ!");
			doDL(model);
			model.addAttribute("login", true);
			redirectAttributes.addFlashAttribute("message", new Message("error", "Sai mật khẩu cũ!"));
			return "redirect:/customer/account.htm";
		}
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			LoginController.matKhau = newPass;
			session.update(a);
			t.commit();
			model.addAttribute("message", "Cập nhật thành công!");
			redirectAttributes.addFlashAttribute("message", new Message("success", "Cập nhật thành công!"));
			return "redirect:/customer/account.htm";

		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Cập nhật thất bại!");
		} finally {
			session.close();
		}
		doDL(model);
		model.addAttribute("login", true);
		redirectAttributes.addFlashAttribute("message", new Message("error", "Cập nhật thất bại!"));
		return "redirect:/customer/account.htm";
	}

	public Phim layPhim(Integer id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Phim where MaPhim = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		Phim p = (Phim) query.list().get(0);
		return p;
	}

	public LichChieu layLC(Integer id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM LichChieu where MaSuatChieu = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		LichChieu lc = (LichChieu) query.list().get(0);
		return lc;
	}

	public ChiTietGhePhong LayIdGhe(Integer id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ChiTietGhePhong where IdGheDat = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		ChiTietGhePhong chitiet = (ChiTietGhePhong) query.list().get(0);
		return chitiet;
	}

	public ChiTietGhePhong layThongTinGhe(String tenGhe, String maPhong) {
		Session session = factory.getCurrentSession(); // Sử dụng session hiện tại
		ChiTietGhePhong chiTietGhePhong = null;
		try {
			String hql = "SELECT ct FROM ChiTietGhePhong ct JOIN ct.ghe g JOIN ct.phong p WHERE g.tenGhe = :tenGhe AND p.maPhong = :maPhong";
			Query query = session.createQuery(hql);
			query.setParameter("tenGhe", tenGhe);
			query.setParameter("maPhong", maPhong);
			query.setTimeout(60);
			List<ChiTietGhePhong> results = query.list();
			if (!results.isEmpty()) {
				chiTietGhePhong = results.get(0); // Lấy ghế đầu tiên
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return chiTietGhePhong; // Trả về thông tin ghế
	}

	public List<Ve> layVe(Integer id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Ve where dsLichChieu.maSC = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		@SuppressWarnings("unchecked")
		List<Ve> list = query.list();
		return list;
	}

	public List<Ve> DanhSachVeDat(Integer maSC, List<Integer> idsGheDat, String maPhong) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Ve v " + "WHERE v.dsLichChieu.maSC = :maSC "
				+ "AND v.chiTietGhePhong.idGheDat IN (:idsGheDat) " + "AND v.chiTietGhePhong.phong.maPhong = :maPhong";
		Query query = session.createQuery(hql);
		query.setParameter("maSC", maSC);
		query.setParameterList("idsGheDat", idsGheDat);
		query.setParameter("maPhong", maPhong);
		return query.list();
	}

	public List<Ve> layDanhSachVeTonTai(Integer maSC, List<Integer> idsGheDat, boolean trangThaiDat) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Ve v WHERE v.dsLichChieu.maSC = :maSC AND v.chiTietGhePhong.idGheDat IN (:idsGheDat) AND v.trangThaiDat = :trangThaiDat";
		Query query = session.createQuery(hql);
		query.setParameter("maSC", maSC);
		query.setParameterList("idsGheDat", idsGheDat); // Sử dụng setParameterList cho danh sách
		query.setParameter("trangThaiDat", trangThaiDat);

		return query.list();
	}

	@Transactional
	@RequestMapping("/danh-sach-ghe/{maSC}")
	public void danhSachGhe(@PathVariable("maSC") Integer maSC, Session session, Model model) {
		LichChieu lc = layLC(maSC);

		// Lấy danh sách tất cả ghế từ ChiTietGhePhong
		String hqlGhe = "SELECT chitiet " + "FROM ChiTietGhePhong chitiet WHERE chitiet.phong.maPhong= :maPhong";

		Query queryGhe = session.createQuery(hqlGhe);
		queryGhe.setParameter("maPhong", lc.getDsPhong().getMaPhong());
		List<ChiTietGhePhong> danhSachGhe = queryGhe.list();

		// Lấy trạng thái đặt ghế cho suất chiếu hiện tại
		String hqlVe = "SELECT chitiet, COALESCE(ve.trangThaiDat, false), ve.chiTietGhePhong.idGheDat "
				+ "FROM ChiTietGhePhong chitiet " + "LEFT JOIN chitiet.veList ve "
				+ "WHERE ve.dsLichChieu.maSC = :maSC";

		Query queryVe = session.createQuery(hqlVe);
		queryVe.setParameter("maSC", maSC); // Thêm tham số để lọc theo suất chiếu
		List<Object[]> danhSachVe = queryVe.list();

		// Tạo một Map để lưu trạng thái đặt ghế theo id
		Map<Integer, Boolean> trangThaiDatMap = danhSachVe.stream().filter(chitietVe -> chitietVe[0] != null)
				.collect(Collectors.toMap(chitietVe -> (Integer) chitietVe[2], // idGheDat
						chitietVe -> (Boolean) chitietVe[1], // trangThaiDat
						(existing, replacement) -> existing // Giữ giá trị đầu tiên
				));

		// Tạo danh sách ghế theo hàng
		Map<String, List<Map<String, Object>>> gheTheoHang = danhSachGhe.stream().filter(chitiet -> chitiet != null)
				.collect(Collectors.groupingBy(chitiet -> chitiet.getGhe().getTenGhe().substring(0, 1),
						Collectors.mapping(chitiet -> {
							Map<String, Object> gheInfo = new HashMap<>();
							gheInfo.put("idGhe", chitiet.getIdGheDat());
							gheInfo.put("tenGhe", chitiet.getGhe().getTenGhe());
							gheInfo.put("trangThaiDat", trangThaiDatMap.getOrDefault(chitiet.getIdGheDat(), false)); 
							gheInfo.put("gia", chitiet.getLoaiGhe().getGia());
							return gheInfo;
						}, Collectors.toList())));

		model.addAttribute("gheTheoHang", gheTheoHang);
	}

	@Transactional
	@RequestMapping("/payment/{maSC}.htm")
	public String payment(Model model, @PathVariable("maSC") Integer maSC) {
		Session session = factory.getCurrentSession();
		LichChieu lc = layLC(maSC);
		Integer maPhim = lc.getDsPhim().getMaPhim();
		Phim p = layPhim(maPhim);

//		String hql = "UPDATE Ve SET TrangThaiDat = 0 WHERE MaKH IS NULL OR MaKH != :makh";
//		Query query = session.createQuery(hql);
//		query.setParameter("makh", LoginController.kh.getMaKH());
//		 query.executeUpdate();

		if (LoginController.taikhoan.getEmail() == null) {
			model.addAttribute("login", false);
			return "login";
		}
		
		Query query = session.createQuery(
			    "SELECT ctdg.phanTramThayDoi, ctdg.thaydoigia.lyDo " +
			    "FROM ChiTietThayDoiGia ctdg " +
			    "WHERE ctdg.dsLichChieu.maSC = :maSC"
			);
		query.setParameter("maSC", maSC);
		Object[] result = (Object[]) query.uniqueResult();

		Float phanTramThayDoi = 0f;
		String lyDoThayDoi = "";

		if (result != null) {
		    phanTramThayDoi = (Float) result[0];
		    lyDoThayDoi = (String) result[1];
		}
        
		model.addAttribute("user", LoginController.kh);
		model.addAttribute("tk", LoginController.taikhoan);
		model.addAttribute("lv", LoginController.kh.getVeList());
		model.addAttribute("login", true);
		model.addAttribute("phim", p);
		model.addAttribute("lc", lc);
		model.addAttribute("phantramthaydoi", phanTramThayDoi);
		model.addAttribute("lydothaydoi", lyDoThayDoi);
		danhSachGhe(maSC, session, model);

		return "customer/payment";
	}

	@SuppressWarnings("deprecation")
	@RequestMapping("/payment_1/{maSC}/{ghe}.htm")
	public String payment1(ModelMap model, @PathVariable("maSC") Integer maSC, @PathVariable("ghe") String ghe) {
		LichChieu lc = layLC(maSC);
		if (lc == null) {
			model.addAttribute("message", "Không tìm thấy Lịch Chiếu.");
			return "error";
		}

		List<String> danhSachGhe = Arrays.asList(ghe.split(","));
		List<Ve> danhSachVe = new ArrayList<>();
		List<ChiTietGhePhong> thongTinGheDat = new ArrayList<>();
		List<Integer> idsGheDat = new ArrayList<>();
		int tongTien = 0;
		int donGia = 0;

		Session session = factory.openSession();
		Transaction t = null;

		try {
			t = session.beginTransaction();
			
			Query query = session.createQuery(
				    "SELECT ctdg.phanTramThayDoi, ctdg.thaydoigia.lyDo " +
				    "FROM ChiTietThayDoiGia ctdg " +
				    "WHERE ctdg.dsLichChieu.maSC = :maSC"
				);
			query.setParameter("maSC", maSC);
			Object[] result = (Object[]) query.uniqueResult();

			Float phanTramThayDoi = 0f;
			String lyDoThayDoi = "";

			if (result != null) {
			    phanTramThayDoi = (Float) result[0];
			    lyDoThayDoi = (String) result[1];
			}
	        
			for (String tenGhe : danhSachGhe) {
				ChiTietGhePhong gheDat = layThongTinGhe(tenGhe, lc.getDsPhong().getMaPhong());
				if (gheDat != null) {
					thongTinGheDat.add(gheDat);
					idsGheDat.add(gheDat.getIdGheDat());
				}
			}

			List<Ve> veTonTaiList = layDanhSachVeTonTai(maSC, idsGheDat, false);

			Map<Integer, Ve> veTonTaiMap = veTonTaiList.stream()
					.collect(Collectors.toMap(v -> v.getChiTietGhePhong().getIdGheDat(), v -> v));

			for (ChiTietGhePhong gheDat : thongTinGheDat) {
				Ve veTonTai = veTonTaiMap.get(gheDat.getIdGheDat());
				if (veTonTai != null) {
					veTonTai.setTrangThaiDat(true);
					session.update(veTonTai);
					danhSachVe.add(veTonTai);
				} else {
					Ve v = new Ve();
					v.setDsLichChieu(lc);
					v.setNgayBan(new Date());
					v.setTrangThaiDat(true);
					v.setChiTietGhePhong(gheDat);
					session.save(v);
					danhSachVe.add(v);
				}

				if (gheDat.getLoaiGhe() != null) {
					int idLoaiGhe = gheDat.getLoaiGhe().getIdLoaiGhe();
					if (idLoaiGhe == 1) {
						donGia = 45000;
					} else if (idLoaiGhe == 2) {
						donGia = 50000;
					} else if (idLoaiGhe == 3) {
						donGia = 100000;
					}
				}
				if(phanTramThayDoi != 0) {
					donGia *= phanTramThayDoi;
					tongTien += donGia;
				}
				else {
					tongTien += donGia;
				}
			}

			t.commit();

			System.out.println("Danh sách vé đã tạo hoặc cập nhật: " + danhSachVe);

			model.addAttribute("lc", lc);
			model.addAttribute("danhSachVe", danhSachVe);
			model.addAttribute("ghe", danhSachGhe);
			model.addAttribute("tongTien", tongTien);
			model.addAttribute("login", true);
			model.addAttribute("user", LoginController.kh);
			model.addAttribute("phantramthaydoi", phanTramThayDoi);
			model.addAttribute("lydothaydoi", lyDoThayDoi);

			return "customer/payment_1";
		} catch (Exception e) {
			if (t != null) {
				t.rollback();
			}
			return "redirect:/customer/payment_1/" + maSC + "/" + ghe + ".htm";
		} finally {
			session.close();
		}
	}

	@RequestMapping(value = "/update-ticket-status", method = RequestMethod.POST)
	public String updateTicketStatus(@RequestParam Integer maSC, @RequestParam String ghe,
			@RequestParam String maPhong) {
		List<String> danhSachGhe = Arrays.asList(ghe.split(","));
		LichChieu lc = layLC(maSC);
		System.out.println("maSC: " + maSC);
		System.out.println("Danh sách ghế: " + danhSachGhe);
		System.out.println("maPhong: " + maPhong);

		List<Integer> idsGheDat = new ArrayList<>();
		for (String tenGhe : danhSachGhe) {
			ChiTietGhePhong gheDat = layThongTinGhe(tenGhe, lc.getDsPhong().getMaPhong());
			if (gheDat != null) {
				idsGheDat.add(gheDat.getIdGheDat());
			}
		}

		Session session = factory.openSession();
		Transaction t = null;
		try {
			t = session.beginTransaction();

			List<Ve> danhSachVe = DanhSachVeDat(maSC, idsGheDat, maPhong);

			int batchSize = 20;
			int count = 0;
			for (Ve ve : danhSachVe) {
				System.out.println(ve.getMaVe());
				ve.setTrangThaiDat(false);
				session.update(ve);

				if (++count % batchSize == 0) {
					session.flush();
					session.clear();
				}
			}

			t.commit();
		} catch (Exception e) {
			if (t != null) {
				t.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return "redirect:/DoAnWebCinema/customer/payment_1/" + maSC + ".htm";
	}

	@RequestMapping(value = "/cancel-booking", method = RequestMethod.POST)
	public String cancelBooking(@RequestParam Integer maSC, @RequestParam String ghe) {
		List<String> danhSachGhe = Arrays.asList(ghe.split(","));
		LichChieu lc = layLC(maSC);
		System.out.println("maSC: " + maSC);
		System.out.println("Danh sách ghế hủy: " + danhSachGhe);

		List<Integer> idsGheDat = new ArrayList<>();
		for (String tenGhe : danhSachGhe) {
			ChiTietGhePhong gheDat = layThongTinGhe(tenGhe, lc.getDsPhong().getMaPhong());
			if (gheDat != null) {
				idsGheDat.add(gheDat.getIdGheDat());
			}
		}

		Session session = factory.openSession();
		Transaction t = null;
		try {
			t = session.beginTransaction();

			for (Integer idGhe : idsGheDat) {
				Ve ve = (Ve) session.get(Ve.class, idGhe);
				if (ve != null) {
					ve.setTrangThaiDat(false);
					session.update(ve);
				}
			}

			t.commit();
		} catch (Exception e) {
			if (t != null) {
				t.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}

		return "redirect:/DoAnWebCinema/customer/payment/" + maSC + ".htm";
	}

	@RequestMapping("/payment_2/{maSC}/{ghe}.htm")
	public String payment2(ModelMap model, @PathVariable("maSC") Integer maSC, @PathVariable("ghe") String ghe) {
		System.out.println("Bắt đầu xử lý payment_2 với maSC: " + maSC + " và ghe: " + ghe);
		LichChieu lc = layLC(maSC);
		if (lc == null) {
			model.addAttribute("message", "Không tìm thấy Lịch Chiếu.");
			return "error";
		}

		List<String> danhSachGhe = Arrays.asList(ghe.split(","));
		List<Ve> danhSachVe = new ArrayList<>();
		List<ChiTietGhePhong> thongTinGheDat = new ArrayList<>();
		System.out.println("maSC: " + maSC);
		System.out.println("ghe: " + ghe);
		System.out.println("danhSachGhe: " + danhSachGhe);
		int tongTien = 0;
		int donGia = 0;

		// Chuyển đổi danh sách tên ghế thành danh sách id ghế
		List<Integer> idsGheDat = new ArrayList<>();
		for (String tenGhe : danhSachGhe) {
			ChiTietGhePhong gheDat = layThongTinGhe(tenGhe, lc.getDsPhong().getMaPhong());
			if (gheDat != null) {
				thongTinGheDat.add(gheDat);
				idsGheDat.add(gheDat.getIdGheDat());
			}
		}

		// Sử dụng openSession() để có một session mới
		Session session = factory.openSession();
		Transaction t = null;

		try {
			t = session.beginTransaction();
			Query query = session.createQuery(
				    "SELECT ctdg.phanTramThayDoi, ctdg.thaydoigia.lyDo " +
				    "FROM ChiTietThayDoiGia ctdg " +
				    "WHERE ctdg.dsLichChieu.maSC = :maSC"
				);
			query.setParameter("maSC", maSC);
			Object[] result = (Object[]) query.uniqueResult();

			Float phanTramThayDoi = 0f;
			String lyDoThayDoi = "";

			if (result != null) {
			    phanTramThayDoi = (Float) result[0];
			    lyDoThayDoi = (String) result[1];
			}
			// Lấy danh sách vé tồn tại bằng cách sử dụng phương thức DanhSachVeDat
			List<Ve> veTonTai = DanhSachVeDat(maSC, idsGheDat, lc.getDsPhong().getMaPhong());
			for (Ve ve : veTonTai) {
				ve.setKhachHang(LoginController.kh); // Cập nhật khách hàng
				ve.setTrangThaiDat(true); // Cập nhật trạng thái đặt
				session.update(ve); // Cập nhật vé
				danhSachVe.add(ve);

				// Tính tiền dựa vào loại ghế
				ChiTietGhePhong gheDat = ve.getChiTietGhePhong();
				if (gheDat.getLoaiGhe() != null) {
					int idLoaiGhe = gheDat.getLoaiGhe().getIdLoaiGhe();
					if (idLoaiGhe == 1) {
						donGia = 45000;
					} else if (idLoaiGhe == 2) {
						donGia = 50000;
					} else if (idLoaiGhe == 3) {
						donGia = 100000;
					}
					if(phanTramThayDoi != 0) {
						donGia *= phanTramThayDoi;
						tongTien += donGia;
					}
					else {
						tongTien += donGia;
					}
				}
			}

			t.commit();

			System.out.println("Danh sách vé đã cập nhật: " + danhSachVe);

			model.addAttribute("lc", lc);
			model.addAttribute("danhSachVe", danhSachVe);
			model.addAttribute("ghe", danhSachGhe);
			model.addAttribute("tongTien", tongTien);
			model.addAttribute("login", true);
			model.addAttribute("user", LoginController.kh);

			return "customer/payment_2";
		} catch (Exception e) {
			if (t != null) {
				t.rollback();
			}
			return "redirect:/customer/payment_1/" + maSC + "/" + ghe + ".htm";
		} finally {
			session.close();
		}
	}

}

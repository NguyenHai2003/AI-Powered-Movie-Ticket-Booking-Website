 package admin.controller;

import java.io.File;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import poly.controller.LoginController;
import poly.entity.DaoDien;
import poly.entity.DienVien;
import poly.entity.KhachHang;
import poly.entity.LichChieu;
import poly.entity.NhanVien;
import poly.entity.Phim;
import poly.entity.PhongChieu;
import poly.entity.TaiKhoan;
import poly.entity.TheLoai;
import poly.entity.Ve;
import poly.entity.ChiNhanh;
import poly.entity.VaiDien;

@SuppressWarnings("unused")
@Transactional
@Controller
@RequestMapping("/admin/")
public class ShowController {
	@Autowired
	SessionFactory factory;
	
    @Autowired
    ServletContext context;
	
	public List<KhachHang> getUsers() {
		Session session = factory.getCurrentSession();
		String hql = "FROM KhachHang";
		Query query = session.createQuery(hql);
		List<KhachHang> list = query.list();
		return list;
	}
	public List<Ve> getVes() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Ve";
		Query query = session.createQuery(hql);
		List<Ve> list = query.list();
		return list;
	}
	
	public List<Phim> getPhims(){
		Session session = factory.getCurrentSession();
		String hql = "FROM Phim where maTT = 0 or maTT = 1";
		Query query = session.createQuery(hql);
		List<Phim> list = query.list();
		return list;
	}
	
	public List<Phim> getListPhims(){
		Session session = factory.getCurrentSession();
		String hql = "FROM Phim";
		Query query = session.createQuery(hql);
		List<Phim> list = query.list();
		return list;
	}
	
	public List<Phim> getMoviesByMonthAndYear(Integer month, Integer year) {
	    Session session = factory.openSession();
	    Query query = session.createQuery("FROM Phim p WHERE MONTH(p.ngayKhoiChieu) = :month AND YEAR(p.ngayKhoiChieu) = :year");
	    query.setParameter("month", month);
	    query.setParameter("year", year);
	    List<Phim> movies = query.list();
	    session.close();
	    return movies;
	}
	
	public List<DienVien> getDanhSachDienVien() {
	    Session session = factory.getCurrentSession();
	    String hql = "FROM DienVien ORDER BY tenDienVien ASC";
	    Query query = session.createQuery(hql);
	    List<DienVien> dienVien = query.list();
	    return dienVien;
	}
	
	@RequestMapping(value = "/dashboard.htm", method = RequestMethod.GET)
	public String filterMoviesByMonth(
	        @RequestParam(value = "month", required = false, defaultValue = "1") Integer month,
	        @RequestParam(value = "year", required = false, defaultValue = "2024") Integer year,
	        Model model) {
	    System.out.println("Month: " + month + ", Year: " + year);
		int countUser = getUsers().size();
		int countVe = getVes().size();
		int countPhim = getPhims().size();
	    List<Phim> phimList = getMoviesByMonthAndYear(month, year);
		Map<Integer, Double> doanhThuTheoPhim = new HashMap<>();
	    for (Phim phim : phimList) {
	        Double doanhThu = tinhTongDoanhThuTheoPhim(phim.getMaPhim());
	        doanhThuTheoPhim.put(phim.getMaPhim(), doanhThu);
	    }
	    Double tongDoanhThu = tinhTongDoanhThu();
	    model.addAttribute("phim", phimList);
		model.addAttribute("countUser", countUser);
		model.addAttribute("countVe", countVe);
		model.addAttribute("countPhim", countPhim);
		model.addAttribute("doanhThuTheoPhim", doanhThuTheoPhim);
		model.addAttribute("tongDoanhThu", tongDoanhThu);
	    return "admin/dashboard";
	}
	
	@RequestMapping("profile")
	public String profile(ModelMap model,HttpSession ss) {
		model.addAttribute("tk", LoginController.taikhoan);		
		model.addAttribute("user", LoginController.nv);
		model.addAttribute("mk", LoginController.matKhau);
		
		if (LoginController.nv != null) {
	        ChiNhanh chiNhanh = LoginController.nv.getChiNhanh(); // Giả sử NhanVien có liên kết tới ChiNhanh
	        model.addAttribute("chiNhanh", chiNhanh);
	    } else {
	        model.addAttribute("chiNhanh", null);
	    }
		return "admin/profile";
	}
	
	@RequestMapping(value="employee",method = RequestMethod.GET)
	public String employee(ModelMap model,HttpServletRequest request,HttpSession ss) {
		HttpSession session = request.getSession();
		if(session.getAttribute("user")==null)
		{
			model.addAttribute("user",LoginController.nv);
			model.addAttribute("tk", LoginController.taikhoan);
		}
		else
		{
			TaiKhoan a= (TaiKhoan) session.getAttribute("tk");
			model.addAttribute("tk",a);
			
			NhanVien nv = (NhanVien) session.getAttribute("user");
			model.addAttribute("user", nv);
		}
		
		Session session_1 = factory.getCurrentSession(); 
		String hql = "SELECT nv FROM NhanVien nv JOIN nv.dstaikhoan tk WHERE tk.quyen.maQuyen = 'NV'";
		Query query = session_1.createQuery(hql);
		List<NhanVien> list = query.list();
		model.addAttribute("nv", list);
		model.addAttribute("NhanVien", new NhanVien());
		model.addAttribute("TaiKhoan", new TaiKhoan());
		return "admin/employee";
	}
	
	@RequestMapping("customer")
	public String customer(ModelMap model,HttpServletRequest request,HttpSession ss) {
		Session session = factory.getCurrentSession(); 
		String hql = "FROM KhachHang";
		Query query = session.createQuery(hql); 
		List<KhachHang> list = query.list();
		model.addAttribute("kh", list);
		return "admin/customer";
	}
	
	@RequestMapping("type")
	public String type(ModelMap model,HttpServletRequest request,HttpSession ss) {
		Session session = factory.getCurrentSession(); 
		String hql = "FROM TheLoai";
		Query query = session.createQuery(hql); 
		List<TheLoai> list = query.list();
		model.addAttribute("type", list);
		return "admin/type";
	}
	
	@RequestMapping("movie")
	public String movie(ModelMap model, HttpServletRequest request, HttpSession ss) {
	    Session session = factory.getCurrentSession();
	    String hqlPhim = "FROM Phim";
	    Query queryPhim = session.createQuery(hqlPhim);
	    List<Phim> listPhim = queryPhim.list();
	    
	    // Lấy danh sách diễn viên cho từng phim
	    for (Phim phim : listPhim) {
	        String hqlVaiDien = "SELECT v FROM VaiDien v WHERE v.phim.maPhim = :maPhim";
	        Query queryVaiDien = session.createQuery(hqlVaiDien);
	        queryVaiDien.setParameter("maPhim", phim.getMaPhim());
	        List<VaiDien> vaiDiens = queryVaiDien.list();
	        phim.setVaiDiens(vaiDiens); // Gán danh sách vai diễn cho phim
	    }
	    
	    model.addAttribute("phim", listPhim);
	    model.addAttribute("listDienVien", getDanhSachDienVien());
	    model.addAttribute("dsCTTL", getAllCTTL());
	    
	    return "admin/movie";
	}



	public List<TheLoai> getAllCTTL() {
		Session session = factory.getCurrentSession();
		String hql = "FROM TheLoai";
		Query query = session.createQuery(hql);
		return  query.list();
	}
	

	  @RequestMapping("ticket")
	  public String ticket(ModelMap model,HttpServletRequest request,HttpSession ss){ 
		  Session session =factory.getCurrentSession();
		  ChiNhanh chiNhanh = LoginController.nv.getChiNhanh();
		  Integer maChiNhanh = chiNhanh.getMaChiNhanh();
		  String hql = "FROM Ve v JOIN v.dsLichChieu lc JOIN lc.dsPhong p JOIN p.chiNhanh cn WHERE cn.maChiNhanh = :maChiNhanh";
		  Query query =session.createQuery(hql);
		  query.setParameter("maChiNhanh", maChiNhanh);
		  List<Ve> list = query.list();
		  model.addAttribute("lv", list); 
		  return "admin/ticket"; 
	}

	  @RequestMapping("room")
	  public String room(ModelMap model, HttpServletRequest request, HttpSession ss) {
	      Session session = factory.getCurrentSession();
		  ChiNhanh chiNhanh = LoginController.nv.getChiNhanh();
		  Integer maChiNhanh = chiNhanh.getMaChiNhanh();
	      String sql = "{call UpdateTrangThaiPhong()}";
	      Query querySP = session.createSQLQuery(sql);
	      querySP.executeUpdate();
	      
	      String hql = "FROM PhongChieu WHERE maChiNhanh = :maChiNhanh";
	      Query query = session.createQuery(hql);
	      query.setParameter("maChiNhanh", maChiNhanh);
	      List<PhongChieu> list = query.list();
	      
	      for (PhongChieu phong : list) {
	          String hqlSeats = "SELECT COUNT(c) FROM ChiTietGhePhong c WHERE c.phong.maPhong = :maPhong";
	          Query querySeats = session.createQuery(hqlSeats);
	          querySeats.setParameter("maPhong", phong.getMaPhong());
	          Long totalSeats = (Long) querySeats.uniqueResult();
	          phong.setTongSoGhe(totalSeats.intValue());
	      }
	      
	      model.addAttribute("pc", list);
	      return "admin/room";
	  }

	
	@RequestMapping("directors")
    public String directors(ModelMap model, HttpServletRequest request, HttpSession ss) {
        Session session = factory.getCurrentSession();
        String hql = "FROM DaoDien";
        Query query = session.createQuery(hql);
        List<DaoDien> list = query.list();
		Map<Integer, Double> doanhThuTheoDaoDien = new HashMap<>();
	    for (DaoDien daodien : list) {
	        Double doanhThu = tinhTongDoanhThuTheoDaoDien(daodien.getIdDaoDien());
	        doanhThuTheoDaoDien.put(daodien.getIdDaoDien(), doanhThu);
	    }
	    model.addAttribute("doanhthu", doanhThuTheoDaoDien);
        model.addAttribute("daodien", list);
        return "admin/directors";
    }

    @RequestMapping(value = "directors/add.htm", method = RequestMethod.POST)
    @Transactional
    public String addDirector(ModelMap model, @ModelAttribute("daoDien") DaoDien daoDien, @RequestParam("directorPhoto") MultipartFile daodienPhoto,
                              RedirectAttributes redirectAttributes) {
        try {
            Session session = factory.getCurrentSession();
            String photoPath = null;
            if (daodienPhoto.isEmpty()) {
                model.addAttribute("message", "Vui lòng chọn file !");
            } else {
                try {
                    photoPath = context.getRealPath("/uploads/" + daodienPhoto.getOriginalFilename());
                    daodienPhoto.transferTo(new File(photoPath));
                    System.out.println("Đường dẫn: " + photoPath);
                    redirectAttributes.addFlashAttribute("photo_name", daodienPhoto.getOriginalFilename());
                    daoDien.setAnh(daodienPhoto.getOriginalFilename());
                } catch (Exception e) {
                    model.addAttribute("message", "Lỗi lưu file");
                    return "admin/movie";
                }
            }

            session.save(daoDien);
            redirectAttributes.addFlashAttribute("message", new Message("success", "Thêm đạo diễn thành công"));
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("message", "Lỗi khi thêm đạo diễn!");
            throw e;
        }
        return "redirect:/admin/directors.htm";
    }
    
    @RequestMapping(value = "actors/add.htm", method = RequestMethod.POST)
    @Transactional
    public String addAirector(ModelMap model, @ModelAttribute("dienVien") DienVien dienvien, @RequestParam("actorPhoto") MultipartFile dienvienPhoto,
                              RedirectAttributes redirectAttributes) {
        try {
            Session session = factory.getCurrentSession();
            String photoPath = null;
            if (dienvienPhoto.isEmpty()) {
                model.addAttribute("message", "Vui lòng chọn file !");
            } else {
                try {
                    photoPath = context.getRealPath("/uploads/" + dienvienPhoto.getOriginalFilename());
                    dienvienPhoto.transferTo(new File(photoPath));
                    System.out.println("Đường dẫn: " + photoPath);
                    redirectAttributes.addFlashAttribute("photo_name", dienvienPhoto.getOriginalFilename());
                    dienvien.setAnhDienVien(dienvienPhoto.getOriginalFilename());
                } catch (Exception e) {
                    model.addAttribute("message", "Lỗi lưu file");
                    return "admin/movie";
                }
            }

            session.save(dienvien);
            redirectAttributes.addFlashAttribute("message", new Message("success", "Thêm diên viên thành công"));
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("message", "Lỗi khi thêm diễn viên!");
            throw e;
        }
        return "redirect:/admin/actors.htm";
    }

    @RequestMapping(value = "directors/upload/{idDaoDien}.htm", method = RequestMethod.POST)
    @Transactional
    public String updateDirector(ModelMap model, @ModelAttribute("daoDienUpdate") DaoDien daoDien, 
                                 @RequestParam(value = "directorPhotoUpdate", required = false) MultipartFile daodienPhoto, 
                                 RedirectAttributes redirectAttributes) {
        try {
            if (daodienPhoto != null && !daodienPhoto.isEmpty()) {
                String photoPath = null;
                try {
                    photoPath = context.getRealPath("/uploads/" + daodienPhoto.getOriginalFilename());
                    daodienPhoto.transferTo(new File(photoPath));
                    System.out.println("Đường dẫn ảnh: " + photoPath);
                    daoDien.setAnh(daodienPhoto.getOriginalFilename());
                    redirectAttributes.addFlashAttribute("photo_name", daodienPhoto.getOriginalFilename());
                } catch (Exception e) {
                    model.addAttribute("message", "Lỗi lưu file ảnh");
                    return "admin/movie";
                }
            }
            Session session = factory.getCurrentSession();
            session.update(daoDien);
            redirectAttributes.addFlashAttribute("message", new Message("success", "Cập nhật đạo diễn thành công"));
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("message", "Lỗi khi cập nhật đạo diễn!");
            throw e;
        }
        return "redirect:/admin/directors.htm";
    }
    
    @RequestMapping(value = "actors/upload/{idDienVien}.htm", method = RequestMethod.POST)
    @Transactional
    public String updateAirector(ModelMap model, @ModelAttribute("dienvienUpdate") DienVien dienvien, 
                                 @RequestParam(value = "actorsPhotoUpdate", required = false) MultipartFile dienvienPhoto, 
                                 RedirectAttributes redirectAttributes) {
        try {
            if (dienvienPhoto != null && !dienvienPhoto.isEmpty()) {
                String photoPath = null;
                try {
                    photoPath = context.getRealPath("/uploads/" + dienvienPhoto.getOriginalFilename());
                    dienvienPhoto.transferTo(new File(photoPath));
                    System.out.println("Đường dẫn ảnh: " + photoPath);
                    dienvien.setAnhDienVien(dienvienPhoto.getOriginalFilename());
                    redirectAttributes.addFlashAttribute("photo_name", dienvienPhoto.getOriginalFilename());
                } catch (Exception e) {
                    model.addAttribute("message", "Lỗi lưu file ảnh");
                    return "admin/movie";
                }
            }
            Session session = factory.getCurrentSession();
            session.update(dienvien);
            redirectAttributes.addFlashAttribute("message", new Message("success", "Cập nhật diễn viên thành công"));
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("message", "Lỗi khi cập nhật đạo diễn!");
            throw e;
        }
        return "redirect:/admin/actors.htm";
    }


    @RequestMapping("order")
    public String order(ModelMap model, HttpServletRequest request, HttpSession ss) {
        Session session = factory.getCurrentSession();
        ChiNhanh chiNhanh = LoginController.nv.getChiNhanh();
        Integer maChiNhanh = chiNhanh.getMaChiNhanh();

        String hql = "FROM Ve v " +
                     "JOIN FETCH v.dsLichChieu lc " +
                     "JOIN FETCH lc.dsPhong p " +
                     "JOIN FETCH p.chiNhanh cn " +
                     "WHERE cn.maChiNhanh = :maChiNhanh " +
                     "AND v.khachHang.maKH IS NOT NULL " +
                     "AND v.trangThaiDat = true ";

        String filter = request.getParameter("filter");
        java.sql.Date today = new java.sql.Date(System.currentTimeMillis());
        Calendar calendar = Calendar.getInstance();

        // Áp dụng filter cho câu truy vấn
        if (filter == null || filter.isEmpty() || filter.equals("today")) {
            hql += " AND v.ngayBan = :today";  // So sánh trực tiếp với ngày hiện tại
        }

        if (filter != null && filter.equals("thisMonth")) {
            calendar.set(Calendar.DAY_OF_MONTH, 1);
            java.sql.Date startOfMonth = new java.sql.Date(calendar.getTimeInMillis());

            calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
            java.sql.Date endOfMonth = new java.sql.Date(calendar.getTimeInMillis());

            hql += " AND v.ngayBan BETWEEN :startOfMonth AND :endOfMonth";
        }

        // Tạo query và thiết lập các tham số
        Query query = session.createQuery(hql);
        query.setParameter("maChiNhanh", maChiNhanh);

        if (filter == null || filter.isEmpty() || filter.equals("today")) {
            query.setParameter("today", today);
        }

        if (filter != null && filter.equals("thisMonth")) {
            calendar.set(Calendar.DAY_OF_MONTH, 1);
            java.sql.Date startOfMonth = new java.sql.Date(calendar.getTimeInMillis());

            calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
            java.sql.Date endOfMonth = new java.sql.Date(calendar.getTimeInMillis());

            query.setParameter("startOfMonth", startOfMonth);
            query.setParameter("endOfMonth", endOfMonth);
        }

        // Thực hiện truy vấn
        List<Ve> list = query.list();
        model.addAttribute("ve", list);

        return "admin/order";
    }

    
	public List<Phim> getPhimsTrue(){
		Session session = factory.getCurrentSession();
		String hql = "FROM Phim";
		Query query = session.createQuery(hql);
		List<Phim> list = query.list();
		List<Phim> listTrue = new ArrayList<Phim>();
		for(Phim p : list) {
			if(p.getMaTT()!=0) {
				listTrue.add(p);
			}
		}
		
		return listTrue;
	}

	public List<PhongChieu> getRooms() {
		Session session = factory.getCurrentSession();
		String hql = "FROM PhongChieu";
		Query query = session.createQuery(hql);
		List<PhongChieu> list = query.list();
		return list;
	}
    
	public List<PhongChieu> getListRooms() {
		Session session = factory.getCurrentSession();
        ChiNhanh chiNhanh = LoginController.nv.getChiNhanh();
        Integer maChiNhanh = chiNhanh.getMaChiNhanh();
		String hql = "FROM PhongChieu WHERE chiNhanh.maChiNhanh = :maChiNhanh";
		Query query = session.createQuery(hql);
		query.setParameter("maChiNhanh", maChiNhanh);
		List<PhongChieu> list = query.list();
		return list;
	}
	
	private boolean checkRoomAvailability(Integer maPhim, String maPhong, Date ngayChieu, Time gioChieuTime) {
	    Session session = factory.openSession();
	    String hql = "{CALL Check_TrangThaiPhong(:maPhim, :gioChieu, :ngayChieu, :maPhong)}";
	    Query query = session.createSQLQuery(hql)
	                         .setParameter("maPhim", maPhim)
	                         .setParameter("gioChieu", new java.sql.Time(gioChieuTime.getTime()))
	                         .setParameter("ngayChieu", new java.sql.Date(ngayChieu.getTime()))
	                         .setParameter("maPhong", maPhong);

	    try {
	        Object result = query.uniqueResult();
	        if (result instanceof Integer) {
	            return (Integer) result == 1;
	        }
	        return false;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    } finally {
	        session.close();
	    }
	}
	
	@RequestMapping("showtimes")
	public String showtimes(@RequestParam(value = "filterDate", required = false) String filterDate, ModelMap model, HttpServletRequest request) {
	    Session session = factory.getCurrentSession();
	    ChiNhanh chiNhanh = LoginController.nv.getChiNhanh();
	    Integer maChiNhanh = chiNhanh.getMaChiNhanh();
	    if (filterDate == null || filterDate.isEmpty()) {
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	        filterDate = sdf.format(new Date());
	    }

	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    Date filterDateParsed = null;
	    try {
	        filterDateParsed = sdf.parse(filterDate);
	    } catch (ParseException e) {
	        e.printStackTrace();
	        filterDateParsed = new Date();
	    }

	    String hql = "FROM LichChieu l WHERE l.dsPhong.chiNhanh.maChiNhanh = :maChiNhanh AND l.ngayChieu = :filterDate ORDER BY l.gioChieu ASC";
	    Query query = session.createQuery(hql);
	    query.setParameter("filterDate", filterDateParsed);
	    query.setParameter("maChiNhanh", maChiNhanh);
	    List<LichChieu> list = query.list();

	    List<Phim> phimTrue = getPhimsTrue();
	    List<PhongChieu> phongChieuTrue = getListRooms();

	    SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    Date currentTime = new Date();
	    String currentTimeString = sdf2.format(currentTime);

	    for (LichChieu l : list) {
	        try {
	            Date ngayChieu = l.getNgayChieu();
	            Time gioChieu = l.getGioChieu();
	            String gioChieuString = new SimpleDateFormat("HH:mm:ss").format(gioChieu);
	            String ngayChieuString = new SimpleDateFormat("yyyy-MM-dd").format(ngayChieu);
	            String ngayGioChieuString = ngayChieuString + " " + gioChieuString;
	            int dateComparison = currentTimeString.substring(0, 10).compareTo(ngayChieuString);

	            if (dateComparison > 0) {
	                l.setTrangThai("Đã chiếu");
	            } else if (dateComparison == 0) {
	                if (currentTimeString.substring(11).compareTo(gioChieuString) > 0) {
	                    l.setTrangThai("Đã chiếu");
	                } else {
	                    l.setTrangThai("Chưa chiếu");
	                }
	            } else {
	                l.setTrangThai("Sắp chiếu");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            l.setTrangThai("Lỗi");
	        }
	    }

	    List<String> hours = Arrays.asList("08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23");
	    List<String> minutes = Arrays.asList("00", "15", "30", "45");
	    model.addAttribute("hours", hours);
	    model.addAttribute("minutes", minutes);
	    model.addAttribute("lc", list);
	    model.addAttribute("pct", phongChieuTrue);
	    model.addAttribute("pt", phimTrue);
	    model.addAttribute("filterDate", filterDate);
	    model.addAttribute("dateOptions", getNext7Days());

	    return "admin/showtimes";
	}

	// Tạo danh sách 7 ngày tiếp theo từ ngày hôm nay
	private List<String> getNext7Days() {
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    List<String> dateOptions = new ArrayList<>();
	    Calendar calendar = Calendar.getInstance();
	    for (int i = 0; i < 7; i++) {
	        dateOptions.add(sdf.format(calendar.getTime()));
	        calendar.add(Calendar.DATE, 1);
	    }
	    return dateOptions;
	}


	
	public Double tinhTongDoanhThuTheoPhim(int maPhim) {
	    Session session = factory.getCurrentSession();
	    String hql = "SELECT v FROM Ve v JOIN v.dsLichChieu lc JOIN lc.dsPhim p WHERE p.maPhim = :maPhim AND v.trangThaiDat = true";
	    Query query = session.createQuery(hql); 
	    query.setParameter("maPhim", maPhim);
	    List<Ve> veList = query.list();
	    Double tongDoanhThu = veList.stream()
	        .mapToDouble(ve -> ve.getChiTietGhePhong().getLoaiGhe().getGia())
	        .sum();
	    
	    return tongDoanhThu;
	}
	
	public Double tinhTongDoanhThuTheoDaoDien(int maDaoDien) {
	    Session session = factory.getCurrentSession();
	    String hql = "SELECT p FROM Phim p JOIN p.daoDien dd WHERE dd.idDaoDien = :maDaoDien";
	    Query query = session.createQuery(hql);
	    query.setParameter("maDaoDien", maDaoDien);
	    List<Phim> phimList = query.list();
	    
	    double tongDoanhThu = 0;

	    for (Phim phim : phimList) {
	        tongDoanhThu += tinhTongDoanhThuTheoPhim(phim.getMaPhim());
	    }

	    return tongDoanhThu;
	}

	public Double tinhTongDoanhThu() {
	    List<Phim> phimList = getPhims();
	    double tongDoanhThu = 0;

	    for (Phim phim : phimList) {
	        tongDoanhThu += tinhTongDoanhThuTheoPhim(phim.getMaPhim());
	    }

	    return tongDoanhThu;
	}

	@RequestMapping("seat")
		public String seat(ModelMap model,HttpServletRequest request,HttpSession ss){
		Session session =factory.getCurrentSession();
		String hql = "FROM LoaiGhe";
		Query query =session.createQuery(hql);
		List<Ve> list = query.list();
		model.addAttribute("lg", list); 
		return "admin/seat";
	}
    
    
	@RequestMapping("actors")
	public String actors(ModelMap model, HttpServletRequest request, HttpSession ss) {
	    Session session = factory.getCurrentSession();
	    String hql = "FROM DienVien";
	    Query query = session.createQuery(hql);
	    List<DienVien> list = query.list();
	    model.addAttribute("dienvien", list);
	    List<Integer> dienVienIds = new ArrayList<>();
	    for (DienVien dienVien : list) {
	        dienVienIds.add(dienVien.getIdDienVien());
	    }

	    String roleHql = "SELECT v.tenVaiDien, p.tenPhim, v.dienvien.idDienVien FROM VaiDien v JOIN v.phim p WHERE v.dienvien.idDienVien IN :idDienVienList";
	    Query roleQuery = session.createQuery(roleHql);
	    roleQuery.setParameterList("idDienVienList", dienVienIds);
	    List<Object[]> actorsRolesList = roleQuery.list();
	    Map<Integer, List<Object[]>> actorRolesMap = new HashMap<>();
	    for (Object[] row : actorsRolesList) {
	        Integer actorId = (Integer) row[2];
	        if (!actorRolesMap.containsKey(actorId)) {
	            actorRolesMap.put(actorId, new ArrayList<>());
	        }
	        actorRolesMap.get(actorId).add(row);
	    }

	    model.addAttribute("actorRolesMap", actorRolesMap);
	    return "admin/actors";
	}



}
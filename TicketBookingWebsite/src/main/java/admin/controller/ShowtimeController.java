package admin.controller;

import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.math.BigInteger;
import javax.transaction.Transactional;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.type.StandardBasicTypes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import admin.controller.Message;
import poly.entity.LichChieu;
//import poly.entity.LoaiVe;
import poly.entity.Phim;
import poly.entity.PhongChieu;
import poly.entity.Ve;

@Transactional
@Controller
@RequestMapping("/admin/")
public class ShowtimeController {
	@Autowired
	SessionFactory factory;

	public List<Phim> getPhims() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Phim";
		Query query = session.createQuery(hql);
		List<Phim> list = query.list();
		return list;
	}

	public List<Ve> getOrders() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Ve";
		Query query = session.createQuery(hql);
		List<Ve> list = query.list();
		return list;
	}

	public List<LichChieu> getLichChieus() {
		Session session = factory.getCurrentSession();
		String hql = "FROM LichChieu";
		Query query = session.createQuery(hql);
		List<LichChieu> list = query.list();
		return list;
	}

	public LichChieu getSingleLichChieus(Integer maSC) {
		Session session = factory.getCurrentSession();
		String hql = "FROM LichChieu where maSC=:maSC";
		Query query = session.createQuery(hql);
		query.setParameter("maSC", maSC);
		LichChieu n = (LichChieu) query.list().get(0);

		return n;
	}

	public List<LichChieu> getLichChieusByIdPhim(Integer id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM LichChieu";
		Query query = session.createQuery(hql);
		List<LichChieu> list = query.list();
		List<LichChieu> temp_list = new ArrayList<LichChieu>();
		for (LichChieu l : list) {
			if (l.getDsPhim().getMaPhim() == id) {
				temp_list.add(l);
			}
		}
		return temp_list;
	}

	public List<PhongChieu> getRooms() {
		Session session = factory.getCurrentSession();
		String hql = "FROM PhongChieu";
		Query query = session.createQuery(hql);
		List<PhongChieu> list = query.list();
		return list;
	}

	public PhongChieu getSingleRooms(String maPhong) {
		Session session = factory.getCurrentSession();
		String hql = "FROM PhongChieu where maPhong=:maPhong";
		Query query = session.createQuery(hql);
		query.setParameter("maPhong", maPhong);
		PhongChieu n = (PhongChieu) query.list().get(0);

		return n;
	}

	public Phim getSinglePhims(Integer maPhim) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Phim where maPhim=:maPhim";
		Query query = session.createQuery(hql);
		query.setParameter("maPhim", maPhim);
		Phim n = (Phim) query.list().get(0);

		return n;
	}

	public List<PhongChieu> getListRooms() {
		Session session = factory.getCurrentSession();
		String hql = "FROM PhongChieu";
		Query query = session.createQuery(hql);
		List<PhongChieu> list = query.list();
		/*
		 * List<PhongChieu> listTrue = new ArrayList<PhongChieu>(); for (PhongChieu p :
		 * list) { if (p.getTrangThai() == false) { listTrue.add(p); } }
		 */

		return list;
	}

	@RequestMapping(value = "showtimes/add.htm", method = RequestMethod.POST)
	public String insert(ModelMap model, @ModelAttribute("showtimes") LichChieu showtimes, BindingResult result,
	        @RequestParam("maPhong") String maPhong, @RequestParam("maPhim") String maPhim,
	        @RequestParam("ngayChieu") String ngayChieu, @RequestParam("gioChieu") String gioChieuS,
	        @RequestParam("phutChieu") String phutChieuS, RedirectAttributes redirectAttributes) throws ParseException {
	    int maPhimI = Integer.parseInt(maPhim);
	    PhongChieu p = getSingleRooms(maPhong);
	    Phim ph = getSinglePhims(maPhimI);

	    // Kết hợp giờ và phút thành một chuỗi "HH:mm"
	    String gioPhutChieu = gioChieuS + ":" + phutChieuS;
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm");
	    LocalTime gioChieuI = LocalTime.parse(gioPhutChieu, formatter);
	    Time gioChieuTime = Time.valueOf(gioChieuI);

	    SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
	    Date ngayChieuDate = dateFormatter.parse(ngayChieu);
	    System.out.println(maPhim);
	    System.out.println(maPhong);
	    System.out.println(ngayChieuDate);
	    System.out.println(gioChieuTime);
	    // Gọi stored procedure để kiểm tra trạng thái phòng
	    boolean isRoomAvailable = checkRoomAvailability(maPhimI, maPhong, ngayChieuDate, gioChieuTime);

	    if (!isRoomAvailable) {
	        redirectAttributes.addFlashAttribute("message", new Message("error", "Phòng không khả dụng vào thời gian này"));
	        return "redirect:/admin/showtimes.htm";
	    }

	    List<LichChieu> list = getLichChieus();

	    try {
	        Session session = factory.openSession();
	        Transaction t = session.beginTransaction();
	        try {
	            showtimes.setGioChieu(gioChieuTime);
	            showtimes.setDsPhong(p);
	            showtimes.setDsPhim(ph);
	            if (ngayChieuDate.before(new Date())) {
	                redirectAttributes.addFlashAttribute("message", new Message("error", "Ngày chiếu không hợp lệ"));
	                return "redirect:/admin/showtimes.htm";
	            }
	            showtimes.setNgayChieu(ngayChieuDate);
	            session.save(showtimes);
	            redirectAttributes.addFlashAttribute("message", new Message("success", "Thêm thành công"));
	            t.commit();
	            return "redirect:/admin/showtimes.htm";
	        } catch (Exception e) {
	            t.rollback();
	            System.out.println("error catch " + e.getCause());
	        } finally {
	            session.close();
	        }

	    } catch (Exception e) {
	        // Handle exception
	    }

	    List<Phim> phimTrue = getPhims();
	    List<PhongChieu> phongChieuTrue = getListRooms();
	    model.addAttribute("lc", list);
	    model.addAttribute("pct", phongChieuTrue);
	    model.addAttribute("pt", phimTrue);
	    redirectAttributes.addFlashAttribute("message", new Message("error", "Thêm thất bại - Trùng lịch chiếu"));
	    return "redirect:/admin/showtimes.htm";
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

	@RequestMapping(value = "showtimes/update/{id}.htm", method = RequestMethod.POST)
	public String updateMovie(ModelMap model, @RequestParam("ngayChieu") String ngayChieu,
	        @RequestParam("maPhim") Integer maPhim, @RequestParam("maPhong") String maPhong,
	        @RequestParam("maSC") Integer id, @RequestParam("gioChieu") String gioChieu,
	        @RequestParam("phutChieu") String phutChieu, RedirectAttributes redirectAttributes) {

	    try {
	        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
	        Date ngayChieuDate = formatter.parse(ngayChieu);

	        String fullTime = gioChieu + ":" + phutChieu + ":00";
	        LocalTime gioChieuTime = LocalTime.parse(fullTime, DateTimeFormatter.ofPattern("HH:mm:ss"));
	        Time gioChieuSqlTime = Time.valueOf(gioChieuTime);

	        PhongChieu p = getSingleRooms(maPhong);
	        Phim ph = getSinglePhims(maPhim);
	        Session session = factory.openSession();
	        Transaction t = session.beginTransaction();

	        if (ngayChieuDate.before(new Date())) {
	            redirectAttributes.addFlashAttribute("message", new Message("error", "Không thể sửa các suất chiếu hôm nay"));
	            return "redirect:/admin/showtimes.htm";
	        }

	        if (getSingleLichChieus(id).getDsPhim().getMaTT() != 0) {
	            try {
	                LichChieu showtime = getSingleLichChieus(id);
	                if (checkLichChieu(id) == 1) {
	                    showtime.setGioChieu(gioChieuSqlTime);
	                    showtime.setDsPhim(ph);
	                    showtime.setDsPhong(p);
	                    showtime.setNgayChieu(ngayChieuDate);
	                    session.merge(showtime);
	                    redirectAttributes.addFlashAttribute("message", new Message("success", "sửa thành công"));
	                    t.commit();

	                    return "redirect:/admin/showtimes.htm";
	                }

	            } catch (Exception e) {
	                t.rollback();
	                System.out.println("error catch " + e.getCause());
	            } finally {
	                session.close();
	            }
	        } else {
	            redirectAttributes.addFlashAttribute("message", new Message("error", "Sửa thất bại phim đã ngừng chiếu"));
	            t.commit();

	            return "redirect:/admin/showtimes.htm";
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    List<LichChieu> list = getLichChieus();
	    model.addAttribute("LichChieu", list);

	    redirectAttributes.addFlashAttribute("message", new Message("error", "sửa thất bại"));
	    return "redirect:/admin/showtimes.htm";
	}



	@RequestMapping(value = "showtimes/delete/{id}.htm", method = RequestMethod.POST)
	public String delete_User(ModelMap model, @PathVariable("id") Integer id, RedirectAttributes redirectAttributes) {
		try {
			LichChieu lc = getSingleLichChieus(id);
			Integer temp = this.deleteNews(id);
			if (temp == 1) {
				redirectAttributes.addFlashAttribute("message", new Message("success", "xóa thành công"));
				System.out.println("Xóa thành công!");
			} else if (temp == 0) {
				redirectAttributes.addFlashAttribute("message", new Message("error", "xóa thất bại"));
				System.out.println("Xóa thất bại!");
			}

			return "redirect:/admin/showtimes.htm";
		} catch (Exception e) {
			System.out.println(e);

		}

		List<LichChieu> list = getLichChieus();
		model.addAttribute("lc", list);
		redirectAttributes.addFlashAttribute("message", new Message("error", "xóa thất bại"));
		return "redirect:/admin/showtimes.htm";
	}

	public Integer deleteNews(Integer id) {
		LichChieu lc = new LichChieu();
		lc.setMaSC(id);
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			List<Ve> lVe = getOrders();

			for (Ve v : lVe) {
				System.out.println("dong 246:   " + v.getDsLichChieu().getMaSC());
				if (lc.getMaSC() == v.getDsLichChieu().getMaSC()) {
//					session.delete(lc);
					System.out.println("success");
					return 0;
				}

			}
			session.delete(lc);
			t.commit();
			System.out.println("sau commit");
			return 1;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println(e);
			t.rollback();
			return 0;
		} finally {
			session.close();
		}

	}

	public Integer checkLichChieu(Integer id) {
		LichChieu lc = new LichChieu();
		lc.setMaSC(id);
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			List<Ve> lVe = getOrders();
			for (Ve v : lVe) {
				//System.out.println("dong 246:   " + v.getDsLichChieu().getMaSC());
				if (lc.getMaSC() == v.getDsLichChieu().getMaSC()) {
					System.out.println("success");
					return 0;
				}
			}
			return 1;
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println(e);
			t.rollback();
			return 0;
		} finally {
			session.close();
		}

	}
}

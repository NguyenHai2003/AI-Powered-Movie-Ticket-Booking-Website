package poly.controller;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import poly.controller.LoginController;
import poly.entity.DanhGiaPhim;
import poly.entity.Phim;
@Transactional
@Controller
public class SearchController {
	@Autowired
	SessionFactory factory;  
	
	public Phim layPhim(String tenPhim) {
	    Session session = factory.getCurrentSession();
	    String hql = "FROM Phim WHERE tenPhim LIKE :tenPhim ORDER BY LENGTH(tenPhim) ASC";
	    Query query = session.createQuery(hql);
	    query.setParameter("tenPhim", "%" + tenPhim.trim() + "%");

	    List<Phim> list = query.list();

	    if (!list.isEmpty()) {
	        return list.get(0);
	    }
	    return null;
	}

	
	@RequestMapping("/search")
	public String search(ModelMap model, @ModelAttribute("search") String search, RedirectAttributes redirectAttributes) {
	    Session session = factory.getCurrentSession();
	    String s = search.trim();
	    Phim p = layPhim(s);
	    if(p == null) {
	        return "redirect:/home.htm";
	    }
	    if(LoginController.taikhoan.getEmail() == null) {
	        redirectAttributes.addFlashAttribute("login", false);
	    } else {
	        redirectAttributes.addFlashAttribute("login", true);
	    }
	    DanhGiaPhim existingRating = (DanhGiaPhim) session.createQuery("FROM DanhGiaPhim WHERE phim.maPhim = :maPhim AND khachhang.maKH = :maKH")
	            .setParameter("maPhim", p.getMaPhim())
	            .setParameter("maKH", LoginController.kh.getMaKH())
	            .uniqueResult();
	    int ratingScore = (existingRating != null) ? existingRating.getDiem() : 0;
	    redirectAttributes.addFlashAttribute("ratingScore", ratingScore);
	    
	    return "redirect:/film/detail/ma=" + p.getMaPhim() + ".htm";
	}

	
	@RequestMapping(value = "/saveRating", method = RequestMethod.POST)
	public String saveRating(@RequestParam("rating") int rating, @RequestParam("maPhim") int maPhim) {
	    System.out.println("Đánh giá nhận được: " + rating);
	    System.out.println("Mã phim nhận được: " + maPhim);

	    Session session = factory.openSession();
	    Transaction t = null;
	    try {
	        t = session.beginTransaction();
	        Phim phim = (Phim) session.get(Phim.class, maPhim);
	        if (phim == null) {
	            return "error";
	        }

	        DanhGiaPhim existingRating = (DanhGiaPhim) session.createQuery("FROM DanhGiaPhim WHERE phim.maPhim = :maPhim AND khachhang.maKH = :maKH")
	                .setParameter("maPhim", maPhim)
	                .setParameter("maKH", LoginController.kh.getMaKH())
	                .uniqueResult();
	        if (existingRating != null) {
	            existingRating.setDiem(rating);
	            session.update(existingRating);
	        } else {
	            DanhGiaPhim danhGiaPhim = new DanhGiaPhim();
	            danhGiaPhim.setDiem(rating);
	            danhGiaPhim.setPhim(phim);
	            danhGiaPhim.setKhachHang(LoginController.kh);
	            danhGiaPhim.setNgayDanhGia(new Date());

	            session.save(danhGiaPhim);
	        }

	        t.commit();
	        return "redirect:/DoAnWebCinema/film/detail/ma=" + maPhim + ".htm";
	    } catch (Exception e) {
	        if (t != null) t.rollback();
	        e.printStackTrace();
	        return "error";
	    } finally {
	        session.close();
	    }
	}


}
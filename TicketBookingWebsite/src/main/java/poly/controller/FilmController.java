package poly.controller;


import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import poly.controller.LoginController;
import poly.entity.LichChieu;
import poly.entity.Phim;

@Transactional
@Controller
@RequestMapping("/film")
public class FilmController {
	@Autowired
	SessionFactory factory;

	
	
	public Phim layPhim(Integer maPhim)
	{
		//makh.trim();
		Session session = factory.getCurrentSession();
		String hql = "FROM Phim where MaPhim = :maPhim";
		Query query = session.createQuery(hql);
		query.setParameter("maPhim", maPhim);
		Phim p =(Phim)query.list().get(0);
		return p;
	}
	
	public List<LichChieu> layLichChieu(Integer maPhim) {
		Session session = factory.getCurrentSession();
		String hql = "FROM LichChieu where MaPhim = :maPhim";
		Query query = session.createQuery(hql);
		query.setParameter("maPhim", maPhim);
		List<LichChieu> list = query.list();
		
		return list;
	}
	

	@RequestMapping("/detail/ma={id}.htm")
	public String detail(ModelMap model, @PathVariable("id") Integer id) {
		Phim p = layPhim(id);
		model.addAttribute("phim", p);
		//System.out.println(LocalTime.now());
		if(LoginController.taikhoan.getEmail() == null) {
			model.addAttribute("login", false);
			model.addAttribute("day", LocalDate.now());
		}
		else {
			model.addAttribute("login", true);
			model.addAttribute("user", LoginController.kh);
			model.addAttribute("tk", LoginController.taikhoan);
			model.addAttribute("lv", LoginController.kh.getVeList());
			model.addAttribute("day", LocalDate.now());
		}
        // Add current date to model
        String currentDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        model.addAttribute("currentDate", currentDate);
		return "detail";
	}
	
	@RequestMapping("detail/ma={id}/{ngay}.htm")
	public String showtimes(ModelMap model,@PathVariable("id") Integer id, @PathVariable("ngay") String ngay) {
		Date date = null;
		try {
			date = new SimpleDateFormat("yyyy-MM-dd").parse(ngay.trim());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Phim p = layPhim(id);
		List<LichChieu> list = layLichChieu(id);
		List<LichChieu> list_phu = new ArrayList<LichChieu>();
		for(LichChieu u : list) {
			if(u.getNgayChieu().compareTo(date) == 0 )
				if(u.getNgayChieu().after(new Date())){
					list_phu.add(u);
				}
				else {
                    Time currentTime = Time.valueOf(LocalTime.now());
                    if (u.getGioChieu().after(currentTime)) {
                        list_phu.add(u);
                    }
			}
		}
		if(LoginController.taikhoan.getEmail() == null) {
			model.addAttribute("login", false);
		}
		else {
			model.addAttribute("login", true);
			model.addAttribute("user", LoginController.kh);
			model.addAttribute("tk", LoginController.taikhoan);
			model.addAttribute("lv", LoginController.kh.getVeList());
		}
		model.addAttribute("phim", p);
		model.addAttribute("lc", list_phu);
		model.addAttribute("day", LocalDate.now());
		
        // Add current date to model
        String currentDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        model.addAttribute("currentDate", currentDate);
		
		return "detail";
	}
}
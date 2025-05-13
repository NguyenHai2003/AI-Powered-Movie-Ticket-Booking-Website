package poly.controller;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.controller.LoginController;
import poly.entity.Phim;

@Transactional
@Controller
public class home {
    @Autowired
    SessionFactory factory;
    
	@RequestMapping("/home")
	public String home(ModelMap model) {
		if(LoginController.taikhoan.getEmail() == null) {
			model.addAttribute("login", false);
		}
		else {
			model.addAttribute("login", true);
			model.addAttribute("user", LoginController.kh);
		}
		
        List<Phim> phimList = getMovies();
        model.addAttribute("phimList", phimList);
        
		return "home";
	}
	
    //All phim
    public List<Phim> getMovies() {
   	 Session session = factory.getCurrentSession();
        String hql = "FROM Phim";
        Query query = session.createQuery(hql);
        @SuppressWarnings("unchecked")
        List<Phim> list = query.list();
        return list;
   }
}
package poly.controller;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import poly.entity.*;

@Transactional
@Controller
public class SuKienController {
    @Autowired
    SessionFactory factory;
	
    @RequestMapping(value = "sukienDetail", method = RequestMethod.GET)
    public String SuKienDetail(@RequestParam("id") int id, ModelMap model) {
        SuKien sukien = getSuKienById(id);
        model.addAttribute("sukien", sukien);
        model.addAttribute("user", LoginController.kh);
        String currentDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        model.addAttribute("currentDate", currentDate);
        return "sukienDetail";
    }
    
	public List<SuKien> getSuKien() {
	   	 Session session = factory.getCurrentSession();
	        String hql = "FROM SuKien";
	        Query query = session.createQuery(hql);
	        @SuppressWarnings("unchecked")
	        List<SuKien> list = query.list();
	        return list;
	   }
	
	 public SuKien getSuKienById(int id) {
	        Session session = factory.getCurrentSession();
	        String hql = "FROM SuKien WHERE MaSK = :id";
	        Query query = session.createQuery(hql);
	        query.setParameter("id", id);
	        SuKien sukien = (SuKien) query.uniqueResult();
	        return sukien;
	 }
}


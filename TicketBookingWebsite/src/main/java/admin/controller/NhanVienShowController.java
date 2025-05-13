package admin.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.controller.LoginController;
import poly.entity.ChiNhanh;

@SuppressWarnings("unused")
@Transactional
@Controller
@RequestMapping("/staff/")
public class NhanVienShowController {
	@Autowired
	SessionFactory factory;
	
    @Autowired
    ServletContext context;
    
	@RequestMapping("profile")
	public String profile(ModelMap model,HttpSession ss) {
		model.addAttribute("tk", LoginController.taikhoan);		
		model.addAttribute("user", LoginController.nv);
		model.addAttribute("mk", LoginController.matKhau);
		
		if (LoginController.nv != null) {
	        ChiNhanh chiNhanh = LoginController.nv.getChiNhanh();
	        model.addAttribute("chiNhanh", chiNhanh);
	    } else {
	        model.addAttribute("chiNhanh", null);
	    }
		return "staff/profile";
	}
	
	@RequestMapping("password")
	public String change(ModelMap model) {
		model.addAttribute("user", LoginController.nv);
		model.addAttribute("tk", LoginController.taikhoan);
		return "staff/password";
	}
}

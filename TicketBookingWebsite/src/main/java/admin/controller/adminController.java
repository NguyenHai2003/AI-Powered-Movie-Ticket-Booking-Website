package admin.controller;

import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.transaction.Transactional;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import poly.controller.LoginController;
import poly.entity.*;

@Transactional
@Controller
@RequestMapping("admin")

public class adminController {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping(value="/edit/employee/{maNV}/{email}.htm",method=RequestMethod.POST)
	public String edit(ModelMap model, 
			@RequestParam("tenNV") String tenNV,
			@RequestParam("soDT") String soDT,
			@RequestParam("diaChi") String diaChi,
			@PathVariable("maNV") Integer maNV, 
			@PathVariable("email") String email , RedirectAttributes redirectAttributes)throws NoSuchAlgorithmException {
		boolean kt = true;
		if(kt==false) {
			model.addAttribute("user",LoginController.nv);
			model.addAttribute("tk", LoginController.taikhoan);
			model.addAttribute("mk", LoginController.matKhau);
			return "admin/profile";
		}
		
		Session session_1 = factory.getCurrentSession();
		String hql_1 = "UPDATE NhanVien set TenNV = :tenNV, SDT = :soDT, DiaChi = :diaChi WHERE MaNV = :maNV";
		Query query_1 = session_1.createQuery(hql_1);
		query_1.setParameter("tenNV", tenNV.trim().toString());
		if(soDT.trim().toString().length() > 10) {
			redirectAttributes.addFlashAttribute("message",
					new Message("error","Cập Nhập Thất bại"));
			return "redirect:/admin/profile.htm";
		}
		query_1.setParameter("soDT", soDT.trim().toString());
		query_1.setParameter("diaChi", diaChi);
		query_1.setParameter("maNV", maNV);
		int affectedRows_1 = query_1.executeUpdate();
		LoginController.nv.setTenNV(tenNV.trim().toString());
		LoginController.nv.setSoDT(soDT.trim().toString());
		LoginController.nv.setDiaChi(diaChi.trim().toString());

		model.addAttribute("user", LoginController.nv);
		model.addAttribute("tk", LoginController.taikhoan);
		redirectAttributes.addFlashAttribute("message",
				new Message("success","Cập Nhập Thành Công "));
		return "redirect:/admin/profile.htm";
	}
}

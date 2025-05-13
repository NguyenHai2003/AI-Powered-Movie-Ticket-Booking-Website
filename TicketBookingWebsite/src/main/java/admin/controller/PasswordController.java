package admin.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import poly.controller.LoginController;
import poly.entity.TaiKhoan;
import admin.controller.Message;
import externalFunc.func;
@Transactional
@Controller
@RequestMapping("/admin/")
public class PasswordController {

	@Autowired
	SessionFactory factory;
	
	@RequestMapping("password")
	public String change(ModelMap model) {
		model.addAttribute("user", LoginController.nv);
		model.addAttribute("tk", LoginController.taikhoan);
		return "admin/password";
	}
	
	public void doDL(ModelMap model) {
		model.addAttribute("user", LoginController.nv);
		model.addAttribute("tk", LoginController.taikhoan);
	}
	
	@RequestMapping(value = "/change/password", method = RequestMethod.POST)
	public String updatePass(ModelMap model, HttpSession ss, HttpServletRequest request, RedirectAttributes redirectAttributes)
			throws NoSuchAlgorithmException {
		String oldPass = request.getParameter("oldPass");
		String newPass = request.getParameter("newPass");
		String cfnewPass = request.getParameter("confirmPass");
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(oldPass.trim().getBytes());
		byte[] digest = md.digest();
		String myHash = func.bytesToHex(digest).toLowerCase();
		TaiKhoan a = LoginController.taikhoan;
		if (newPass.toString().trim().length() >8) {
			model.addAttribute("message1", "Mật khẩu không quá 8 ký tự");
			doDL(model);
			System.out.println(0);
			redirectAttributes.addFlashAttribute("message",
					new Message("error","mk k quá 8 kí tự"));
			return "redirect:/admin/password.htm";
		}
		if (oldPass.equals(LoginController.matKhau)) {
			if (newPass.equals(cfnewPass)) {
				MessageDigest md1 = MessageDigest.getInstance("MD5");
				md1.update(newPass.trim().getBytes());
				byte[] digest1 = md1.digest();
				String myHash1 = func.bytesToHex(digest1).toLowerCase();
				a.setPassword(myHash1);
				System.out.println(1);
			} else {
				model.addAttribute("message1", "Mật khẩu xác nhận không giống nhau");
				redirectAttributes.addFlashAttribute("message",
						new Message("error","mật khẩu xác nhận không giống nhau"));
				doDL(model);
				System.out.println(2);
				//model.addAttribute("login", true);
				return "redirect:/admin/password.htm";
			}
			if(newPass.equals("01234567") == true ) {
				model.addAttribute("message1", "Khách hàng nên đổi mật khẩu mới để bảo mật!");
				redirectAttributes.addFlashAttribute("message",
						new Message("error","Không sử dụng mật khẩu này"));
				doDL(model);
				System.out.println(3);
				//model.addAttribute("login", true);
				return "redirect:/admin/password.htm";
			}
		} else {
			model.addAttribute("message1", "Sai mật khẩu cũ!");
			redirectAttributes.addFlashAttribute("message",
					new Message("error","sai mật khẩu cũ"));
			doDL(model);
			System.out.println(4);
			//model.addAttribute("login", true);
			return "redirect:/admin/password.htm";
		} 
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			LoginController.matKhau = newPass;
			session.update(a);
			t.commit();
//			model.addAttribute("message", "Cáº­p nháº­t thÃ nh cÃ´ng!");
			redirectAttributes.addFlashAttribute("message",
					new Message("success","Đổi mật khẩu thành công"));
			System.out.println(5);
			return "redirect:/admin/password.htm";
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message1", "Cập nhật thất bại");
			System.out.println(6);
			redirectAttributes.addFlashAttribute("message",
					new Message("error","sửa thất bại catch"));
			
		} finally {
			session.close();
		}
		doDL(model);
		//model.addAttribute("login", true);
		System.out.println(7);
		redirectAttributes.addFlashAttribute("message",
				new Message("error","sửa thất bại"));
		return "redirect:/admin/password.htm";
	
	}
}

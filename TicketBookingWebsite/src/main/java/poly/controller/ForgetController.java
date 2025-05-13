package poly.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import poly.bean.Validator_check;
import poly.entity.TaiKhoan;
import externalFunc.func;

@Transactional
@Controller
@RequestMapping("/forget")
public class ForgetController {
	@Autowired
	SessionFactory factory;
		
	@Autowired
	JavaMailSender mailer;
	
	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap model,HttpServletRequest request,HttpSession ss) {
		
		HttpSession session = request.getSession();
		if(LoginController.taikhoan.getEmail() == null)
		{
			model.addAttribute("login","Login");
		}
		else
		{
			session.removeAttribute("user");
			model.addAttribute("login","Login");
			LoginController.taikhoan = new TaiKhoan();
		}
		model.addAttribute("login", false);
		return "forget";
	}
	
	@RequestMapping(value = "/reset",method=RequestMethod.POST)
	public String insert(ModelMap model,HttpServletRequest request,HttpSession ss,
			@ModelAttribute("email") String email) throws NoSuchAlgorithmException
	{
		email.trim();
		if(email.equals("") == true) {
			model.addAttribute("errorTK", "Email không được để trống!");
			return "forger";
		}
		
		Session session = factory.getCurrentSession(); 
		String hql = "FROM TaiKhoan";
		Query query = session.createQuery(hql); 
		List<TaiKhoan> list = query.list();
		String mknewString=Validator_check.generateRandomNumber()+"";
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(mknewString.getBytes());
		byte[] digest = md.digest();
		String myHash = func.bytesToHex(digest).toLowerCase();
	    		
		for(TaiKhoan u : list) {
			if(email.equals(u.getEmail().trim())==true) {
				try {
					Session session_1 = factory.getCurrentSession();
					String hql_1 = "UPDATE TaiKhoan set Password = :myHash where Email = :email";
					Query query_1 = session_1.createQuery(hql_1);
					query_1.setParameter("myHash",myHash);
					query_1.setParameter("email", email);
					int affectedRows_1 = query_1.executeUpdate();
					
					//Sử dụng lớp trợ giúp
					MimeMessage mail=mailer.createMimeMessage();
MimeMessageHelper helper= new MimeMessageHelper(mail,true);
					 
					helper.setFrom("movie","movie");
					helper.setTo(email);
					helper.setReplyTo("movie","movie");
					helper.setSubject("LẤY LẠI MẬT KHẨU!");
					String body="Mật khẩu mới của bạn là: "+mknewString; 
					helper.setText(body,true);
					
					mailer.send(mail);
					
					model.addAttribute("messageA","Vào email của bạn để lấy mật khẩu mới!");
					model.addAttribute("login", false);
					
					return "forget";
				}
				catch(Exception e)
				{
					model.addAttribute("messageA","Lấy mật khẩu mới thất bại!");
					model.addAttribute("login", false);
					return "forget";
				}
			}
		}
		model.addAttribute("login", false);
		model.addAttribute("messageA", "Email đăng kí không tồn tại!");
		return "forget";
	}
}
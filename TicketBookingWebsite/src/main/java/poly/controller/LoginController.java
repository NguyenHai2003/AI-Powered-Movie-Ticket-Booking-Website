package poly.controller;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import poly.entity.KhachHang;
import poly.entity.NhanVien;
import poly.entity.TaiKhoan;

import externalFunc.func;

@Transactional
@Controller
@RequestMapping("/login")
public class LoginController {
	@Autowired
	SessionFactory factory;
	
	public static TaiKhoan taikhoan=new TaiKhoan();
	public static NhanVien nv=new NhanVien();
	public static KhachHang kh=new KhachHang();
	public static String matKhau;
	
	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap model,HttpServletRequest request,HttpSession ss) {
		
		//HttpSession session = request.getSession();
		if(LoginController.taikhoan.getEmail() == null)
		{
			//model.addAttribute("login","Login");
		}
		else
		{
			LoginController.taikhoan = new TaiKhoan();
		}
		model.addAttribute("login", false);
		return "login";
	}
	
	public NhanVien layNV(String email)
	{
		email.trim();
		Session session = factory.getCurrentSession();
		String hql = "FROM NhanVien where Email = :email";
		Query query = session.createQuery(hql);
		query.setParameter("email", email);
		NhanVien p =(NhanVien)query.list().get(0);
		return p;
	}
	
	@RequestMapping(value = "/login",method=RequestMethod.POST)
	public String insert(ModelMap model,HttpServletRequest request,HttpSession ss) throws NoSuchAlgorithmException {
	    HttpSession session1 = request.getSession();
	    session1.removeAttribute("user");

	    String username = request.getParameter("email");
	    String password = request.getParameter("password");

	    username.trim();
	    password.trim();
	    MessageDigest md = MessageDigest.getInstance("MD5");
	    md.update(password.getBytes());
	    byte[] digest = md.digest();
	    String myHash = func.bytesToHex(digest).toLowerCase();

	    boolean kt = true;
	    // Kiểm tra mật khẩu đăng nhập
	    if (password.equals("")) {
	        model.addAttribute("errorMK", "Password cannot be empty!");
	        kt = false;
	    }

	    if (!kt) {
	        return "login";
	    }

	    Session session = factory.getCurrentSession();
	    String hql = "FROM TaiKhoan";
	    Query query = session.createQuery(hql);
	    List<TaiKhoan> list = query.list();

	    for (TaiKhoan u : list) {
	        if (username.equals(u.getEmail().trim())) {
	            if (!myHash.equals(u.getPassword().trim())) {
	                model.addAttribute("messageA", "Incorrect password!");
	                model.addAttribute("login", "Login");
	                return "login";
	            } else {
	                if (u.getQuyen().getMaQuyen().trim().equals("QL")) {
	                    taikhoan = u;
	                    nv = taikhoan.getNhanvienlist().iterator().next();
	                    matKhau = password;
	                    ss.setAttribute("tk", taikhoan);
	                    ss.setAttribute("user", nv);
	                    ss.setAttribute("mk", matKhau);
	                    return "redirect:/admin/profile.htm";
	                } else if (u.getQuyen().getMaQuyen().trim().equals("KH")) {
	                    taikhoan = u;
	                    kh = taikhoan.getKhachhanglist().iterator().next();
	                    matKhau = password;
	                    ss.setAttribute("tk", taikhoan);
	                    ss.setAttribute("user", kh);
	                    ss.setAttribute("mk", matKhau);
	                    ss.setAttribute("login", true);
	                    if (ss.getAttribute("BackUrl") == null) {
                            return "redirect:/trangchu.htm";
                        } else {
                            return "redirect:" + ss.getAttribute("BackUrl");
                        }
	                } else if(u.getQuyen().getMaQuyen().trim().equals("NV")) {
	                    taikhoan = u;
	                    nv = taikhoan.getNhanvienlist().iterator().next();
	                    matKhau = password;
	                    ss.setAttribute("tk", taikhoan);
	                    ss.setAttribute("user", nv);
	                    ss.setAttribute("mk", matKhau);
	                    return "redirect:/staff/profile.htm";
	                }
	                else {
	                    model.addAttribute("messageA", "Please log in again!");
	                    model.addAttribute("login", "Login");
	                    return "login";
	                }
	            }
	        }
	    }
	    model.addAttribute("messageA", "Email does not exist!");
	    model.addAttribute("login", "Login");
	    return "login";
	}

	
	@RequestMapping("logout")
	public String logout() {
		if(taikhoan.getQuyen().getMaQuyen().trim().equals("QL"))
		{
			nv = new NhanVien();
		}
		
		//Kiểm tra mã quyên có phải KHÁCH HÀNG không!
		else if(taikhoan.getQuyen().getMaQuyen().trim().equals("KH"))
		{
			kh = new KhachHang();
		}
		taikhoan = new TaiKhoan();
		return "login";
	}
}
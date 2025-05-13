package poly.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import poly.entity.TaiKhoan;
import poly.bean.Validator_check;
import poly.entity.KhachHang;
import poly.entity.Quyen;
import externalFunc.func;

@Transactional
@Controller
@RequestMapping("/register")
public class RegisterController {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap model,HttpServletRequest request,HttpSession ss) {
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
		    model.addAttribute("login", "Guest");
		} else {
		    Object user = session.getAttribute("user");
		    if (user instanceof TaiKhoan) {
		        TaiKhoan a = (TaiKhoan) user;
		        model.addAttribute("tk", a);
		    } else {
		        // Xử lý trường hợp người dùng không phải là TaiKhoan
		        model.addAttribute("login", "Invalid User");
		    }
		}
		model.addAttribute("login", false);
		model.addAttribute("KhachHang",new KhachHang());
		model.addAttribute("TaiKhoan",new TaiKhoan());
		return "register";
	}
	
	public boolean ktTaiKhoan(String tk)
	{
		Session session = factory.getCurrentSession();
		String hql = "FROM TaiKhoan ";
		Query query = session.createQuery(hql);
		List<TaiKhoan> list = query.list();
		for(TaiKhoan k : list)
		{
			if(k.getEmail().trim().equals(tk))
			{
				return false;
			}
		}
		return true;
	}
	
	public Quyen ktQuyen()
	{
		Session session = factory.getCurrentSession();
		String hql = "FROM Quyen ";
		Query query = session.createQuery(hql);
		List<Quyen> list = query.list();
		for(Quyen k : list)
		{
			if(k.getMaQuyen().trim().equals("KH"))
			{
				return k;
			}
		}
		return null;
	}
	
	@RequestMapping(value = "insert",method=RequestMethod.POST)
	public String insert(ModelMap model,@Validated @ModelAttribute("KhachHang") KhachHang khachHang,HttpServletRequest request,BindingResult errors,HttpSession ss,@ModelAttribute("dstaikhoan") TaiKhoan taiKhoan) throws NoSuchAlgorithmException
	{
		HttpSession session1 = request.getSession();
		if(session1.getAttribute("user")==null)
		{
			
		}
		else
		{
			Object user = session1.getAttribute("user");
			if (user instanceof TaiKhoan) {
			    TaiKhoan a = (TaiKhoan) user;
			    model.addAttribute("tk", a);
			    session1.removeAttribute("user");
			}
		}
		
		
		
		/*String captcha = ss.getAttribute("captcha_security").toString();
		String verifyCaptcha = request.getParameter("captcha");*/
		String ngay = request.getParameter("day");
		String thang = request.getParameter("month");
		String nam = request.getParameter("year");
		String sDate = thang + "/" + ngay +"/" + nam;
        Date date = null;
		try {
			date = new SimpleDateFormat("MM/dd/yyyy").parse(sDate);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		khachHang.setNgaySinh(date);
		LocalDate dateOfBirth = khachHang.getNgaySinh().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
		boolean kt = true;
		
		 if (!Validator_check.isMinimumAge(dateOfBirth, 12)) {
		    	
		        errors.rejectValue("tenKH", "KhachHang", "Bạn phải lớn hơn " + 12 + " tuổi để đăng ký!");
		        kt = false;
		    }
			
		if (khachHang.getTenKH().trim().toString().equals("")) {
			errors.rejectValue("tenKH", "KhachHang", "Họ và tên không được để trống!");
			kt = false;
		}
		if (khachHang.getDiaChi().trim().toString().equals("")) {
			errors.rejectValue("diaChi", "KhachHang", "Địa chỉ không được để trống!");
			kt = false;
		}
		if (khachHang.getSoDT().trim().toString().equals("")) {
			errors.rejectValue("soDT", "KhachHang", "Số điện thoại không được để trống!");
			kt = false;
		}
		 if (!Validator_check.isValidPhoneNumber(khachHang.getSoDT())) {
		        errors.rejectValue("soDT", "KhachHang", "Số điện thoại không hợp lệ!");
		        kt = false;
		    }

		if (khachHang.getDstaikhoan().getEmail().trim().toString().equals("")) {
			errors.rejectValue("dstaikhoan.email", "KhachHang", "Email không được để trống!");
			kt = false;
		}
		if (ktTaiKhoan(khachHang.getDstaikhoan().getEmail().trim().toString())==false) {
			errors.rejectValue("dstaikhoan.email", "KhachHang", "Email đã tồn tại!");
			kt = false;
		}
		if (khachHang.getDstaikhoan().getPassword().trim().toString().equals("")) {
			errors.rejectValue("dstaikhoan.password", "KhachHang", "Mật khẩu không được để trống!");
			kt = false;
		}
		
		if (khachHang.getDstaikhoan().getPassword().trim().toString().length() <=3) {
			errors.rejectValue("dstaikhoan.password", "KhachHang", "Mật khẩu quá ngắn!");
			kt = false;
		}
		/*if(captcha.equals(verifyCaptcha)==false)
		{
			model.addAttribute("errorCaptcha", "Please enter correct Captcha");
			kt=false;
		}*/
		if(kt == false)
		{
			model.addAttribute("login", false);
			return "register";
		}
		
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(khachHang.getDstaikhoan().getPassword().getBytes());
		byte[] digest = md.digest();
	    String myHash = func.bytesToHex(digest).toLowerCase();
		
	    //khachHang.setDoanhSo(0);
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		taiKhoan.setEmail(khachHang.getDstaikhoan().getEmail());
		taiKhoan.setPassword(myHash);
		taiKhoan.setQuyen(ktQuyen());
		try
		{
			session.save(taiKhoan);
			session.save(khachHang);
			t.commit();
			
			model.addAttribute("tk",taiKhoan);
			ss.setAttribute("user", taiKhoan);
			model.addAttribute("message","Thêm thành công!");
			model.addAttribute("login", false);
			return "register";
		}
		catch(Exception e)
		{
			t.rollback();
			model.addAttribute("message",e.getMessage());
			model.addAttribute("login",false);
			return "register";
		}
		finally {
			session.close();
		}
		
	}
}
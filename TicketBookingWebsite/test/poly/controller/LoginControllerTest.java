package poly.controller;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.*;

import java.security.MessageDigest;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.ui.ModelMap;

import externalFunc.func;
import poly.entity.KhachHang;
import poly.entity.Quyen;
import poly.entity.TaiKhoan;

@RunWith(MockitoJUnitRunner.class) // Thêm annotation này để Mockito khởi tạo mocks
public class LoginControllerTest {

    @Mock
    private SessionFactory factory;
    
    @Mock
    private Session hibernateSession;
    
    @Mock
    private HttpServletRequest request;
    
    @Mock
    private HttpSession session;
    
    @Mock
    private ModelMap model;

    @Mock
    private Query query;

    @InjectMocks
    private LoginController loginController;

    @Before
    public void setUp() {
        MockitoAnnotations.initMocks(this);  // Thêm dòng này để tránh lỗi null
        when(factory.getCurrentSession()).thenReturn(hibernateSession);
        when(hibernateSession.createQuery("FROM TaiKhoan")).thenReturn(query);
    }

    @Test
    public void testLogin_KH_Success() throws Exception {
        // Mock dữ liệu tài khoản có quyền KH
        TaiKhoan taiKhoan = new TaiKhoan();
        taiKhoan.setEmail("khach2@gmail.com");
        taiKhoan.setPassword(hashMD5("12345"));
        
        Quyen quyen = new Quyen();
        quyen.setMaQuyen("KH");
        taiKhoan.setQuyen(quyen);

        KhachHang khachHang = new KhachHang();
        taiKhoan.setKhachhanglist(Collections.singleton(khachHang));

        List<TaiKhoan> taiKhoanList = Collections.singletonList(taiKhoan);

        when(query.list()).thenReturn(taiKhoanList);
        when(request.getParameter("email")).thenReturn("khach2@gmail.com");
        when(request.getParameter("password")).thenReturn("12345");
        when(request.getSession()).thenReturn(session);
        when(session.getAttribute("BackUrl")).thenReturn(null);

        // Gọi phương thức login
        String result = loginController.insert(model, request, session);

        // Kiểm tra kết quả
        assertEquals("redirect:/trangchu.htm", result);
        verify(session).setAttribute("tk", taiKhoan);
        verify(session).setAttribute("user", khachHang);
        verify(session).setAttribute("mk", "12345");
        verify(session).setAttribute("login", true);
    }
    @Test
    public void testLogin_KH_Failed_WrongPassword() throws Exception {  // Sửa: Thêm `public`
        // Mock tài khoản nhưng nhập sai mật khẩu
        TaiKhoan taiKhoan = new TaiKhoan();
        taiKhoan.setEmail("khach2@gmail.com");
        taiKhoan.setPassword(hashMD5("654321"));

        Quyen quyen = new Quyen();
        quyen.setMaQuyen("KH");
        taiKhoan.setQuyen(quyen);

        List<TaiKhoan> taiKhoanList = Collections.singletonList(taiKhoan);

        when(query.list()).thenReturn(taiKhoanList);
        when(request.getParameter("email")).thenReturn("khach2@gmail.com");
        when(request.getParameter("password")).thenReturn("123456"); // Nhập sai mật khẩu
        when(request.getSession()).thenReturn(session);

        // Gọi phương thức login
        String result = loginController.insert(model, request, session);

        // Kiểm tra kết quả
        assertEquals("login", result);
        verify(model).addAttribute("messageA", "Incorrect password!");
    }
    @Test
    public void testLogin_KH_Failed_UserNotExist() throws Exception {  // Sửa: Thêm `public`
        // Mock danh sách rỗng (tài khoản không tồn tại)
        when(query.list()).thenReturn(Collections.emptyList());
        when(request.getParameter("email")).thenReturn("user@example.com");
        when(request.getParameter("password")).thenReturn("123456");
        when(request.getSession()).thenReturn(session);

        // Gọi phương thức login
        String result = loginController.insert(model, request, session);

        // Kiểm tra kết quả
        assertEquals("login", result);
        verify(model).addAttribute("messageA", "Email does not exist!");
    }

    // Hàm băm MD5 (giống trong code gốc)
    private String hashMD5(String input) throws Exception {
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(input.getBytes());
        byte[] digest = md.digest();
        StringBuilder sb = new StringBuilder();
        for (byte b : digest) {
            sb.append(String.format("%02x", b));
        }
        return sb.toString();
    }
}

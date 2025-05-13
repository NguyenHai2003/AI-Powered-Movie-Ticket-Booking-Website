package poly.controller;

import static org.junit.Assert.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.argThat;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.doNothing;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.util.Collections;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;

import poly.entity.KhachHang;
import poly.entity.Quyen;
import poly.entity.TaiKhoan;

@RunWith(MockitoJUnitRunner.class)
public class RegisterControllerTest {

    @InjectMocks
    private RegisterController registerController;
    
    @Mock
    private SessionFactory factory;
    
    @Mock
    private Session session;
    
    @Mock
    private Transaction transaction;
    
    @Mock
    private Query query;
    
    @Mock
    private HttpServletRequest request;
    
    @Mock
    private HttpSession httpSession;
    
    @Mock
    private ModelMap model;
    
    @Mock
    private BindingResult bindingResult;
    
    @Before
    public void setUp() {
        MockitoAnnotations.initMocks(this);
        // Khi openSession() được gọi từ insert
        when(factory.openSession()).thenReturn(session);
        when(session.beginTransaction()).thenReturn(transaction);
        // Khi getCurrentSession() được gọi từ các phương thức ktTaiKhoan và ktQuyen
        when(factory.getCurrentSession()).thenReturn(session);
    }
    
    @Test
    public void testIndex_NoUser() {
        // Giả lập khi không có user trong session
        when(request.getSession()).thenReturn(httpSession);
        when(httpSession.getAttribute("user")).thenReturn(null);
        
        String view = registerController.index(model, request, httpSession);
        assertEquals("register", view);
        
        // Sửa các lệnh verify để sử dụng matcher cho tất cả các tham số
        verify(model).addAttribute(eq("login"), eq("Guest"));
        verify(model).addAttribute(eq("login"), eq(false));
        verify(model).addAttribute(eq("KhachHang"), any(KhachHang.class));
        verify(model).addAttribute(eq("TaiKhoan"), any(TaiKhoan.class));
    }
    
    @Test
    public void testInsert_Success() throws NoSuchAlgorithmException, ParseException {
        // Chuẩn bị dữ liệu đầu vào hợp lệ
        KhachHang khachHang = new KhachHang();
        khachHang.setTenKH("Test User");
        khachHang.setDiaChi("Ho Chi Minh");
        khachHang.setSoDT("0123456789");
        // Giả lập thông tin ngày sinh hợp lệ (ví dụ: 01/01/2000)
        String day = "01";
        String month = "01";
        String year = "2000";
        
        // Tạo đối tượng TaiKhoan và gán vào KhachHang
        TaiKhoan taiKhoan = new TaiKhoan();
        taiKhoan.setEmail("test@example.com");
        taiKhoan.setPassword("password123");
        khachHang.setDstaikhoan(taiKhoan);
        
        // Thiết lập tham số request
        when(request.getParameter("day")).thenReturn(day);
        when(request.getParameter("month")).thenReturn(month);
        when(request.getParameter("year")).thenReturn(year);
        when(request.getSession()).thenReturn(httpSession);
        when(httpSession.getAttribute("user")).thenReturn(null);
        
        // Giả lập hàm ktTaiKhoan: trả về true nếu email không tồn tại.
        // Ta mô phỏng truy vấn "FROM TaiKhoan " trả về danh sách rỗng.
        when(session.createQuery("FROM TaiKhoan ")).thenReturn(query);
        when(query.list()).thenReturn(Collections.emptyList());
        
        // Giả lập hàm ktQuyen: cần trả về một Quyen có mã "KH".
        Quyen quyen = new Quyen();
        quyen.setMaQuyen("KH");
        when(session.createQuery(argThat(s -> s.contains("FROM Quyen")))).thenReturn(query);
        when(query.list()).thenReturn(Collections.emptyList(), Collections.singletonList(quyen));
        
        // Giả lập quá trình lưu dữ liệu: trả về ID (ví dụ: 1L) thay vì doNothing().
        when(session.save(any(TaiKhoan.class))).thenReturn(1L);
        when(session.save(any(KhachHang.class))).thenReturn(1L);
        doNothing().when(transaction).commit(); // commit() là void, nên dùng doNothing() được
        
        String view = registerController.insert(model, khachHang, request, bindingResult, httpSession, taiKhoan);
        assertEquals("register", view);
        verify(model).addAttribute("message", "Thêm thành công!");
        verify(httpSession).setAttribute("user", taiKhoan);
    }

    @Test
    public void testInsert_InvalidAge() throws NoSuchAlgorithmException, ParseException {
        // Kiểm tra trường hợp ngày sinh không đạt độ tuổi tối thiểu (dưới 12 tuổi)
        KhachHang khachHang = new KhachHang();
        khachHang.setTenKH("Test User");
        khachHang.setDiaChi("Address");
        khachHang.setSoDT("0123456789");
        
        TaiKhoan taiKhoan = new TaiKhoan();
        taiKhoan.setEmail("young@example.com");
        taiKhoan.setPassword("password123");
        khachHang.setDstaikhoan(taiKhoan);
        
        // Thiết lập ngày sinh: chọn năm gần đây (2020) để không đạt tuổi 12
        String day = "01";
        String month = "01";
        String year = "2020";
        when(request.getParameter("day")).thenReturn(day);
        when(request.getParameter("month")).thenReturn(month);
        when(request.getParameter("year")).thenReturn(year);
        when(request.getSession()).thenReturn(httpSession);
        when(httpSession.getAttribute("user")).thenReturn(null);
        
        // Chỉ stub ktTaiKhoan nếu nó được gọi trước khi kiểm tra tuổi
        when(session.createQuery("FROM TaiKhoan ")).thenReturn(query);
        when(query.list()).thenReturn(Collections.emptyList());
        
        // Không stub ktQuyen vì flow không tới đó trong trường hợp tuổi không hợp lệ
        String view = registerController.insert(model, khachHang, request, bindingResult, httpSession, taiKhoan);
        assertEquals("register", view);
        verify(model).addAttribute(eq("login"), eq(false)); // Sử dụng eq() cho consistency
    }
}

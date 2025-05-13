package poly.controller;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.doNothing;
import static org.mockito.Mockito.doThrow;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.io.File;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.ArgumentCaptor;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import admin.controller.Message;
import poly.entity.KhachHang;
import poly.entity.TaiKhoan;

@RunWith(MockitoJUnitRunner.class)
public class CustomerControllerTest {

    @InjectMocks
    private CustomerController customerController;

    @Mock
    private SessionFactory factory;

    @Mock
    private ServletContext context;

    @Mock
    private Session session;

    @Mock
    private Query query;

    @Mock
    private Transaction transaction;

    @Mock
    private HttpServletRequest request;

    @Mock
    private HttpSession httpSession;

    @Mock
    private ModelMap model;

    @Mock
    private RedirectAttributes redirectAttributes;

    @Before
    public void setUp() {
        MockitoAnnotations.initMocks(this);
        when(factory.getCurrentSession()).thenReturn(session);
        when(factory.openSession()).thenReturn(session);
        when(session.beginTransaction()).thenReturn(transaction);
        setupMockUser();
    }

    // Helper method to set up mock user
    private void setupMockUser() {
        KhachHang kh = new KhachHang();
        kh.setMaKH(1);
        kh.setVeList(Collections.emptyList()); // Avoid NullPointerException in account method if called
        TaiKhoan tk = new TaiKhoan();
        tk.setEmail("test@example.com");
        tk.setPassword("hashedPassword"); // Assume hashed for simplicity
        kh.setDstaikhoan(tk);
        LoginController.kh = kh;
        LoginController.taikhoan = tk;
        LoginController.matKhau = "oldPass123"; // Initial password
    }

    // Tests for edit (thay đổi thông tin cá nhân)

    @Test
    public void testEdit_Success_NoPhoto() throws ParseException {
        // Arrange
        String tenKH = "Updated Name";
        boolean gioiTinh = false;
        String soDT = "0123456789";
        String ngaySinh = "1985-05-15";
        String diaChi = "Old Address";
        MultipartFile photo = mock(MultipartFile.class); // Mock MultipartFile instead of null
        Integer maKH = 1;

        when(photo.isEmpty()).thenReturn(true); // Simulate no photo uploaded
        when(session.createQuery(anyString())).thenReturn(query);
        when(query.setParameter(anyString(), any())).thenReturn(query);
        when(query.executeUpdate()).thenReturn(1);

        // Act
        String view = customerController.edit(model, tenKH, gioiTinh, soDT, ngaySinh, diaChi, photo, maKH, redirectAttributes);

        // Assert
        assertEquals("redirect:/customer/account.htm", view);
        verify(query).setParameter("tenKH", "Updated Name");
        verify(query).setParameter("gioiTinh", false);
        verify(query).setParameter("soDT", "0123456789");
        verify(query).setParameter("ngaySinhDate", new SimpleDateFormat("yyyy-MM-dd").parse("1985-05-15"));
        verify(query).setParameter("diaChi", "Old Address");
        verify(query).setParameter("maKH", 1);
        verify(query, times(0)).setParameter(eq("avatar"), anyString()); // No avatar update

        // Capture and assert the message
        ArgumentCaptor<Message> messageCaptor = ArgumentCaptor.forClass(Message.class);
        verify(redirectAttributes).addFlashAttribute(eq("message"), messageCaptor.capture());
        Message capturedMessage = messageCaptor.getValue();

        assertEquals("success", capturedMessage.getType());
        assertEquals("Cập nhật thành công!", capturedMessage.getMessage());
    }


    @Test
    public void testEdit_InvalidInput_EmptyName() throws ParseException {
        // Arrange
        String tenKH = ""; // Empty name
        boolean gioiTinh = true;
        String soDT = "0987654321";
        String ngaySinh = "1990-01-01";
        String diaChi = "New Address";
        MultipartFile photo = mock(MultipartFile.class); // Still need the mock, but no stubbing
        Integer maKH = 1;

        // Removed: when(photo.isEmpty()).thenReturn(true); // Not needed since validation fails early

        // Act
        String view = customerController.edit(model, tenKH, gioiTinh, soDT, ngaySinh, diaChi, photo, maKH, redirectAttributes);

        // Assert
        assertEquals("redirect:/customer/account.htm", view);
        verify(model).addAttribute(eq("errors_tenKH"), eq("Tên khách hàng không được để trống!"));
        
        // Capture the Message argument passed to addFlashAttribute
        ArgumentCaptor<Message> messageCaptor = ArgumentCaptor.forClass(Message.class);
        verify(redirectAttributes).addFlashAttribute(eq("message"), messageCaptor.capture());
        Message capturedMessage = messageCaptor.getValue();

        // Assert the content of the captured Message object
        assertEquals("error", capturedMessage.getType());
        assertEquals("Cập nhật thất bại!", capturedMessage.getMessage());
        
        verify(session, times(0)).createQuery(anyString()); // No DB update
    }



    // Tests for updatePass (thay đổi mật khẩu)

    @Test
    public void testUpdatePass_Success() throws NoSuchAlgorithmException {
        // Arrange
        when(request.getParameter("oldPass")).thenReturn("oldPass123"); // Matches initial password
        when(request.getParameter("newPass")).thenReturn("newPass");
        when(request.getParameter("confirmPass")).thenReturn("newPass");
        doNothing().when(session).update(any(TaiKhoan.class));
        doNothing().when(transaction).commit();

        // Act
        String view = customerController.updatePass(model, httpSession, request, redirectAttributes);

        // Assert
        assertEquals("redirect:/customer/account.htm", view);
        
        // Use ArgumentCaptor to capture the message passed to addFlashAttribute
        ArgumentCaptor<Message> messageCaptor = ArgumentCaptor.forClass(Message.class);
        verify(redirectAttributes).addFlashAttribute(eq("message"), messageCaptor.capture());
        Message capturedMessage = messageCaptor.getValue();
        
        // Assert that the captured message matches the expected content
        assertEquals("success", capturedMessage.getType());
        assertEquals("Cập nhật thành công!", capturedMessage.getMessage());
        
        verify(session).update(LoginController.taikhoan);
        assertEquals("newPass", LoginController.matKhau);
    }


    @Test
    public void testUpdatePass_WrongOldPassword() throws NoSuchAlgorithmException {
        // Arrange
        when(request.getParameter("oldPass")).thenReturn("wrongPass"); // Doesn’t match
        when(request.getParameter("newPass")).thenReturn("newPass");
        when(request.getParameter("confirmPass")).thenReturn("newPass");

        // Act
        String view = customerController.updatePass(model, httpSession, request, redirectAttributes);

        // Assert
        assertEquals("redirect:/customer/account.htm", view);
        
        // Use ArgumentCaptor to capture the message passed to addFlashAttribute
        ArgumentCaptor<Message> messageCaptor = ArgumentCaptor.forClass(Message.class);
        verify(redirectAttributes).addFlashAttribute(eq("message"), messageCaptor.capture());
        Message capturedMessage = messageCaptor.getValue();
        
        // Assert that the captured message content matches the expected content
        assertEquals("error", capturedMessage.getType());
        assertEquals("Sai mật khẩu cũ!", capturedMessage.getMessage());
        
        verify(model).addAttribute(eq("message"), eq("Sai mật khẩu cũ!"));
        verify(model).addAttribute(eq("login"), eq(true));
        verify(session, times(0)).update(any(TaiKhoan.class)); // No update
    }


    @Test
    public void testUpdatePass_MismatchedConfirmPassword() throws NoSuchAlgorithmException {
        // Arrange
        when(request.getParameter("oldPass")).thenReturn("oldPass123"); // Matches initial password
        when(request.getParameter("newPass")).thenReturn("newPass");
        when(request.getParameter("confirmPass")).thenReturn("differentPass");

        // Act
        String view = customerController.updatePass(model, httpSession, request, redirectAttributes);

        // Assert
        assertEquals("redirect:/customer/account.htm", view);

        // Use ArgumentCaptor to capture the message passed to addFlashAttribute
        ArgumentCaptor<Message> messageCaptor = ArgumentCaptor.forClass(Message.class);
        verify(redirectAttributes).addFlashAttribute(eq("message"), messageCaptor.capture());
        Message capturedMessage = messageCaptor.getValue();

        // Assert that the captured message matches the expected content
        assertEquals("error", capturedMessage.getType());
        assertEquals("Mật khẩu xác nhận không giống nhau!", capturedMessage.getMessage());

        verify(session, times(0)).update(any(TaiKhoan.class)); // No update
    }




    @Test
    public void testUpdatePass_NewPassTooLong() throws NoSuchAlgorithmException {
        // Arrange
        when(request.getParameter("oldPass")).thenReturn("oldPass123");
        when(request.getParameter("newPass")).thenReturn("tooLongPassword"); // > 8 chars
        when(request.getParameter("confirmPass")).thenReturn("tooLongPassword");

        // Act
        String view = customerController.updatePass(model, httpSession, request, redirectAttributes);

        // Assert
        assertEquals("redirect:/customer/account.htm", view);
        verify(model).addAttribute(eq("message"), eq("Mật khẩu mới không được quá 8 ký tự!"));

        // Use ArgumentCaptor to capture the argument and compare its properties
        ArgumentCaptor<Message> messageCaptor = ArgumentCaptor.forClass(Message.class);
        verify(redirectAttributes).addFlashAttribute(eq("message"), messageCaptor.capture());

        Message capturedMessage = messageCaptor.getValue();
        assertNotNull(capturedMessage);
        assertEquals("error", capturedMessage.getType());
        assertEquals("Mật khẩu mới không được quá 8 ký tự!", capturedMessage.getMessage());
        
        verify(session, times(0)).update(any(TaiKhoan.class)); // No update
    }


    @Test
    public void testUpdatePass_TransactionFailure() throws NoSuchAlgorithmException {
        // Arrange
        when(request.getParameter("oldPass")).thenReturn("oldPass123");
        when(request.getParameter("newPass")).thenReturn("newPass");
        when(request.getParameter("confirmPass")).thenReturn("newPass");
        doThrow(new RuntimeException("DB error")).when(session).update(any(TaiKhoan.class));
        doNothing().when(transaction).rollback();

        // Act
        String view = customerController.updatePass(model, httpSession, request, redirectAttributes);

        // Assert
        assertEquals("redirect:/customer/account.htm", view);
        verify(model).addAttribute(eq("message"), eq("Cập nhật thất bại!"));

        // Use ArgumentCaptor to capture the argument and compare its properties
        ArgumentCaptor<Message> messageCaptor = ArgumentCaptor.forClass(Message.class);
        verify(redirectAttributes).addFlashAttribute(eq("message"), messageCaptor.capture());

        Message capturedMessage = messageCaptor.getValue();
        assertNotNull(capturedMessage);
        assertEquals("error", capturedMessage.getType());
        assertEquals("Cập nhật thất bại!", capturedMessage.getMessage());

        verify(transaction).rollback();
        verify(session).close();
    }

}
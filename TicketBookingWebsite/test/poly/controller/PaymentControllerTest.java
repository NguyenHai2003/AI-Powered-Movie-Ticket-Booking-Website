package poly.controller;

import static org.junit.Assert.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.doNothing;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletContext;

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

import poly.entity.ChiTietGhePhong;
import poly.entity.LichChieu;
import poly.entity.LoaiGhe;
import poly.entity.PhongChieu;
import poly.entity.Ve;

@RunWith(MockitoJUnitRunner.class)
public class PaymentControllerTest {

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
    private ModelMap model;

    @Before
    public void setUp() {
        MockitoAnnotations.initMocks(this);
        when(factory.getCurrentSession()).thenReturn(session);
        when(factory.openSession()).thenReturn(session);
        when(session.beginTransaction()).thenReturn(transaction);
        setupMockUser();
    }

    private void setupMockUser() {
        LoginController.kh = new poly.entity.KhachHang();
        LoginController.kh.setMaKH(1);
        LoginController.taikhoan = new poly.entity.TaiKhoan();
        LoginController.taikhoan.setEmail("test@example.com");
        LoginController.matKhau = "oldPass123";
    }

    @Test
    public void testPayment1_CalculateTotalPrice_NoPriceAdjustment() {
        // Arrange
        Integer maSC = 1;
        String ghe = "A1,A2"; // 2 ghế
        LichChieu lc = mock(LichChieu.class);
        PhongChieu phong = mock(PhongChieu.class);
        ChiTietGhePhong ghe1 = mock(ChiTietGhePhong.class);
        ChiTietGhePhong ghe2 = mock(ChiTietGhePhong.class);
        LoaiGhe loaiGhe = mock(LoaiGhe.class);

        // Mock lịch chiếu và phòng
        when(lc.getDsPhong()).thenReturn(phong);
        when(phong.getMaPhong()).thenReturn("P1");

        // Mock truy vấn thay đổi giá (không có thay đổi)
        when(session.createQuery("SELECT ctdg.phanTramThayDoi, ctdg.thaydoigia.lyDo FROM ChiTietThayDoiGia ctdg WHERE ctdg.dsLichChieu.maSC = :maSC")).thenReturn(query);
        when(query.setParameter(eq("maSC"), eq(maSC))).thenReturn(query);
        when(query.uniqueResult()).thenReturn(new Object[]{0f, ""}); // phanTramThayDoi = 0

        // Mock layLC
        when(session.createQuery("FROM LichChieu where MaSuatChieu = :id")).thenReturn(query);
        when(query.setParameter("id", maSC)).thenReturn(query);
        when(query.list()).thenReturn(Collections.singletonList(lc));

        // Mock các phương thức phụ thuộc
        when(customerController.layLC(maSC)).thenReturn(lc);
        when(customerController.layThongTinGhe("A1", "P1")).thenReturn(ghe1);
        when(customerController.layThongTinGhe("A2", "P1")).thenReturn(ghe2);
        when(ghe1.getIdGheDat()).thenReturn(1);
        when(ghe2.getIdGheDat()).thenReturn(2);
        when(customerController.layDanhSachVeTonTai(maSC, Arrays.asList(1, 2), false)).thenReturn(Collections.emptyList());
        when(ghe1.getLoaiGhe()).thenReturn(loaiGhe);
        when(ghe2.getLoaiGhe()).thenReturn(loaiGhe);
        when(loaiGhe.getIdLoaiGhe()).thenReturn(1); // Giá 45000
        doNothing().when(session).save(any(Ve.class));
        doNothing().when(transaction).commit();

        // Act
        String view = customerController.payment1(model, maSC, ghe);

        // Assert
        assertEquals("customer/payment_1", view);
        verify(session, times(2)).save(any(Ve.class)); // 2 vé mới được tạo
        verify(transaction).commit();

        // Capture tổng tiền từ model
        ArgumentCaptor<String> attributeNameCaptor = ArgumentCaptor.forClass(String.class);
        ArgumentCaptor<Object> attributeValueCaptor = ArgumentCaptor.forClass(Object.class);
        verify(model, times(7)).addAttribute(attributeNameCaptor.capture(), attributeValueCaptor.capture());

        List<String> attributeNames = attributeNameCaptor.getAllValues();
        List<Object> attributeValues = attributeValueCaptor.getAllValues();

        int tongTienIndex = attributeNames.indexOf("tongTien");
        assertEquals(90000, attributeValues.get(tongTienIndex)); // 45000 * 2 ghế
    }

    @Test
    public void testPayment1_CalculateTotalPrice_WithPriceAdjustment() {
        // Arrange
        Integer maSC = 1;
        String ghe = "A1,B1"; // 2 ghế với loại khác nhau
        LichChieu lc = mock(LichChieu.class);
        PhongChieu phong = mock(PhongChieu.class);
        ChiTietGhePhong ghe1 = mock(ChiTietGhePhong.class);
        ChiTietGhePhong ghe2 = mock(ChiTietGhePhong.class);
        LoaiGhe loaiGhe1 = mock(LoaiGhe.class);
        LoaiGhe loaiGhe2 = mock(LoaiGhe.class);

        // Mock lịch chiếu và phòng
        when(lc.getDsPhong()).thenReturn(phong);
        when(phong.getMaPhong()).thenReturn("P1");

        // Mock truy vấn thay đổi giá (tăng 20%)
        when(session.createQuery("SELECT ctdg.phanTramThayDoi, ctdg.thaydoigia.lyDo FROM ChiTietThayDoiGia ctdg WHERE ctdg.dsLichChieu.maSC = :maSC")).thenReturn(query);
        when(query.setParameter(eq("maSC"), eq(maSC))).thenReturn(query);
        when(query.uniqueResult()).thenReturn(new Object[]{1.2f, "Khuyến mãi"}); // phanTramThayDoi = 1.2

        // Mock layLC
        when(session.createQuery("FROM LichChieu where MaSuatChieu = :id")).thenReturn(query);
        when(query.setParameter("id", maSC)).thenReturn(query);
        when(query.list()).thenReturn(Collections.singletonList(lc)); // Ensure this is the only mock for query.list()

        // Mock các phương thức phụ thuộc
        when(customerController.layLC(maSC)).thenReturn(lc); // Ensure this mock is used
        when(customerController.layThongTinGhe("A1", "P1")).thenReturn(ghe1);
        when(customerController.layThongTinGhe("B1", "P1")).thenReturn(ghe2);
        when(ghe1.getIdGheDat()).thenReturn(1);
        when(ghe2.getIdGheDat()).thenReturn(2);
        when(customerController.layDanhSachVeTonTai(maSC, Arrays.asList(1, 2), false)).thenReturn(Collections.emptyList());
        when(ghe1.getLoaiGhe()).thenReturn(loaiGhe1);
        when(ghe2.getLoaiGhe()).thenReturn(loaiGhe2);
        when(loaiGhe1.getIdLoaiGhe()).thenReturn(1); // Giá 45000
        when(loaiGhe2.getIdLoaiGhe()).thenReturn(2); // Giá 50000
        doNothing().when(session).save(any(Ve.class));
        doNothing().when(transaction).commit();

        // Act
        String view = customerController.payment1(model, maSC, ghe);

        // Assert
        assertEquals("customer/payment_1", view);
        verify(session, times(2)).save(any(Ve.class)); // 2 vé mới được tạo
        verify(transaction).commit();

        // Capture tổng tiền từ model
        ArgumentCaptor<String> attributeNameCaptor = ArgumentCaptor.forClass(String.class);
        ArgumentCaptor<Object> attributeValueCaptor = ArgumentCaptor.forClass(Object.class);
        verify(model, times(7)).addAttribute(attributeNameCaptor.capture(), attributeValueCaptor.capture());

        List<String> attributeNames = attributeNameCaptor.getAllValues();
        List<Object> attributeValues = attributeValueCaptor.getAllValues();

        int tongTienIndex = attributeNames.indexOf("tongTien");
        assertEquals((int) (45000 * 1.2 + 50000 * 1.2), attributeValues.get(tongTienIndex)); // (45000 * 1.2) + (50000 * 1.2) = 114000
    }
}
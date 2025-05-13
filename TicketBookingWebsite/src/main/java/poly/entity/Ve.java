package poly.entity;

import java.util.Date;
import javax.persistence.*;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "VE")
public class Ve {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaVe")
    private Integer maVe;

    @ManyToOne
    @JoinColumn(name = "MaSuatChieu")
    private LichChieu dsLichChieu;

    @ManyToOne
    @JoinColumn(name = "MaKH")
    private KhachHang khachHang;

    @ManyToOne
    @JoinColumn(name = "IdGheDat")
    private ChiTietGhePhong chiTietGhePhong;

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "MM/dd/yyyy")
    @Column(name = "NgayBan")
    private Date ngayBan;

    @ManyToOne
    @JoinColumn(name = "MaNV")
    private NhanVien nhanVien;
    
    @Column(name = "TrangThaiDat")
    private Boolean trangThaiDat;
    
    // Constructors
    public Ve() {}

    // Getters and setters
    public Integer getMaVe() {
        return maVe;
    }

    public void setMaVe(Integer maVe) {
        this.maVe = maVe;
    }

    public LichChieu getDsLichChieu() {
        return dsLichChieu;
    }

    public void setDsLichChieu(LichChieu dsLichChieu) {
        this.dsLichChieu = dsLichChieu;
    }

    public KhachHang getKhachHang() {
        return khachHang;
    }

    public void setKhachHang(KhachHang khachHang) {
        this.khachHang = khachHang;
    }

    public ChiTietGhePhong getChiTietGhePhong() {
        return chiTietGhePhong;
    }

    public void setChiTietGhePhong(ChiTietGhePhong chiTietGhePhong) {
        this.chiTietGhePhong = chiTietGhePhong;
    }

    public Date getNgayBan() {
        return ngayBan;
    }

    public void setNgayBan(Date ngayBan) {
        this.ngayBan = ngayBan;
    }

    public NhanVien getNhanVien() {
        return nhanVien;
    }

    public void setNhanVien(NhanVien nhanVien) {
        this.nhanVien = nhanVien;
    }
    
    public Boolean getTrangThaiDat() {
        return trangThaiDat;
    }

    public void setTrangThaiDat(Boolean trangThaiDat) {
        this.trangThaiDat = trangThaiDat;
    }
}

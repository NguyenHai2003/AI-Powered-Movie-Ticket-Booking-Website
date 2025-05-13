package poly.entity;

import javax.persistence.*;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Collection;
import java.util.Date;

@Entity
@Table(name = "PHIM")
public class Phim {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaPhim")
    private int maPhim;

    @Column(name = "TenPhim")
    private String tenPhim;

    @Column(name = "MoTa", length = 2000)
    private String moTa;

    @Column(name = "NuocSX", length = 10)
    private String nuocSX;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern="MM/dd/yyyy")
    @Column(name = "NgayKhoiChieu")
    private Date ngayKhoiChieu;

    @Column(name = "NamSX")
    private int namSX;

    @Column(name = "ThoiLuong")
    private int thoiLuong;

    @Column(name = "LinkAnh", length = 8000)
    private String linkAnh;

    @Column(name = "LinkTrailer", length = 8000)
    private String linkTrailer;

    @Column(name = "MaTT")
    private int maTT;
    
    @Column(name = "Diem")
    private Float diem;

    @OneToMany(mappedBy="phim")
    @LazyCollection(LazyCollectionOption.FALSE)
    private Collection<ChiTietTheLoai> chiTietTheLoais;
    
    public Collection<ChiTietTheLoai> getChiTietTheLoais() {
        return chiTietTheLoais;
    }

	public void setTheLoaiS(Collection<ChiTietTheLoai> chiTietTheLoais) {
		this.chiTietTheLoais = chiTietTheLoais;
	}
    
    @OneToMany(mappedBy="phim")
    @LazyCollection(LazyCollectionOption.FALSE)
    private Collection<VaiDien> vaiDiens;
    
    public Collection<VaiDien> getVaiDiens() {
        return vaiDiens;
    }

	public void setVaiDiens(Collection<VaiDien> vaiDiens) {
		this.vaiDiens = vaiDiens;
	}
	
    @ManyToOne
    @JoinColumn(name = "IdDaoDien")
    private DaoDien daoDien;

    // Constructors
    public Phim() {}

    // Getters và Setters
    public int getMaPhim() {
        return maPhim;
    }

    public void setMaPhim(int maPhim) {
        this.maPhim = maPhim;
    }

    public String getTenPhim() {
        return tenPhim;
    }

    public void setTenPhim(String tenPhim) {
        this.tenPhim = tenPhim;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public String getNuocSX() {
        return nuocSX;
    }

    public void setNuocSX(String nuocSX) {
        this.nuocSX = nuocSX;
    }

    public Date getNgayKhoiChieu() {
        return ngayKhoiChieu;
    }

    public void setNgayKhoiChieu(Date ngayKhoiChieu) {
        this.ngayKhoiChieu = ngayKhoiChieu;
    }

    public int getNamSX() {
        return namSX;
    }

    public void setNamSX(int namSX) {
        this.namSX = namSX;
    }

    public int getThoiLuong() {
        return thoiLuong;
    }

    public void setThoiLuong(int thoiLuong) {
        this.thoiLuong = thoiLuong;
    }

    public String getLinkAnh() {
        return linkAnh;
    }

    public void setLinkAnh(String linkAnh) {
        this.linkAnh = linkAnh;
    }

    public String getLinkTrailer() {
        return linkTrailer;
    }

    public void setLinkTrailer(String linkTrailer) {
        this.linkTrailer = linkTrailer;
    }
    
    public Float getDiem() {
    	return diem;
    }
    
    public void setDiem(Float diem) {
    	this.diem = diem;
	}
    
    public int getMaTT() {
        return maTT;
    }

    public void setMaTT(int maTT) {
        this.maTT = maTT;
    }
    
    public DaoDien getDaoDien() {
        return daoDien;
    }

    public void setDaoDien(DaoDien daoDien) {
        this.daoDien = daoDien;
    }
}

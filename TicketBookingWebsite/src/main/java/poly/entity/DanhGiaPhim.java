package poly.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="DANHGIAPHIM")
@IdClass(DanhGiaPhimPK.class)
public class DanhGiaPhim implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@ManyToOne
	@JoinColumn(name="MaPhim")
	private Phim phim;
	
	@Id
	@ManyToOne
	@JoinColumn(name="MaKH")
	private KhachHang khachhang;
	
	@Column(name="Diem")
	private int diem;
	
	@Column(name="NgayDanhGia")
	private Date ngayDanhGia;
	
	public DanhGiaPhim() {
		
	}
	
    public Phim getPhim() {
        return phim;
    }

    public void setPhim(Phim phim) {
        this.phim = phim;
    }
    
    public KhachHang getKhachHang() {
        return khachhang;
    }

    public void setKhachHang(KhachHang khachhang) {
        this.khachhang = khachhang;
    }
    
    public int getDiem() {
    	return diem;
    }
    
    public void setDiem(int diem) {
    	this.diem = diem;
    }
    
    public Date getNgayDanhGia() {
    	return ngayDanhGia;
    }
    
    public void setNgayDanhGia(Date ngayDanhGia) {
    	this.ngayDanhGia = ngayDanhGia;
    }
	
}

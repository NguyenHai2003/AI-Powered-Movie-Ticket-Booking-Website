package poly.entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="CHINHANH")
public class ChiNhanh {
	
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaChiNhanh")
    private int maChiNhanh;
    
    @Column(name = "TenChiNhanh")
    private String tenChiNhanh;
    
    @Column(name = "DiaChi")
    private String diaChi;
    
    @OneToMany(mappedBy = "chiNhanh")
    private Collection<NhanVien> nhanVienList;
    
    @OneToMany(mappedBy = "chiNhanh")
    private Collection<PhongChieu> phongChieuList;
    
    public ChiNhanh() {}
    
    public int getMaChiNhanh() {
    	return maChiNhanh;
    }
    
    public void setMaChiNhanh(int maChiNhanh) {
    	this.maChiNhanh = maChiNhanh;
    }
    
    public String getTenChiNhanh() {
    	return tenChiNhanh;
    }
    
    public void setTenChiNhanh(String tenChiNhanh) {
    	this.tenChiNhanh = tenChiNhanh;
    }
    
    public String getDiaChi() {
    	return diaChi;
    }
    
    public void setDiaChi(String diaChi) {
    	this.diaChi = diaChi;
    }
    
    public Collection<NhanVien> getNhanVienList() {
        return nhanVienList;
    }

    public void setNhanVienList(Collection<NhanVien> nhanVienList) {
        this.nhanVienList = nhanVienList;
    }
    
    public Collection<PhongChieu> getPhongChieuList() {
        return phongChieuList;
    }

    public void setPhongChieuList(Collection<PhongChieu> phongChieuList) {
        this.phongChieuList = phongChieuList;
    }
}

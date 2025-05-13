package poly.entity;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.springframework.format.annotation.DateTimeFormat;
@Entity
@Table (name ="KHACH_HANG")
public class KhachHang {
	@Id
	@Column(name = "MaKH")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer maKH; // Mã khách hàng - int
	
	@Column(name = "TenKH")
	private String tenKH; // Tên khách hàng - nvarchar(50)
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern="MM/dd/yyyy")
	@Column(name = "NgaySinh")
	private Date ngaySinh; // Ngày sinh - date
	
//	@Column(name="CMND")
//	private String cmnd; // Chứng minh nhân dân -varchar(12)
	
	@Column(name="SDT")
	private String soDT; // Số điện thoại - varchar(12)
	
	@Column(name="DiaChi")
	private String diaChi; // Địa chỉ nơi ở - nvarchar(50)
	
	@Column(name="GioiTinh")
	private Boolean gioiTinh; // Giới tính - bit
	
    @Column(name = "Avatar", length = 8000)
    private String avatar;
    
	@ManyToOne
	@JoinColumn(name="email")
	private TaiKhoan dstaikhoan;

	@OneToMany(mappedBy="khachHang")
	@LazyCollection(LazyCollectionOption.FALSE)
	private Collection<Ve> veList;
	
	public KhachHang() {
		// TODO Auto-generated constructor stub
	}

	/*public KhachHang(Integer maKH, String tenKH, Date ngaySinh, String cmnd, String soDT, String diaChi,Boolean gioiTinh, String email) {
		super();
		this.maKH = maKH;
		this.tenKH = tenKH;
		this.ngaySinh = ngaySinh;
		this.cmnd = cmnd;
		this.soDT = soDT;
		this.diaChi = diaChi;
		this.gioiTinh = gioiTinh;
		this.email = email;
	}*/

	public Integer getMaKH() {
		return maKH;
	}

	public void setMaKH(Integer maKH) {
		this.maKH = maKH;
	}

	public String getTenKH() {
		return tenKH;
	}

	public void setTenKH(String tenKH) {
		this.tenKH = tenKH;
	}

	public Date getNgaySinh() {
		return ngaySinh;
	}

	public void setNgaySinh(Date ngaySinh) {
		this.ngaySinh = ngaySinh;
	}

	/*public String getCmnd() {
		return cmnd;
	}

	public void setCmnd(String cmnd) {
		this.cmnd = cmnd;
	}*/

	public String getSoDT() {
		return soDT;
	}

	public void setSoDT(String soDT) {
		this.soDT = soDT;
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	public Boolean getGioiTinh() {
		return gioiTinh;
	}

	public void setGioiTinh(Boolean gioiTinh) {
		this.gioiTinh = gioiTinh;
	}

	public TaiKhoan getDstaikhoan() {
		return dstaikhoan;
	}

	public void setDstaikhoan(TaiKhoan dstaikhoan) {
		this.dstaikhoan = dstaikhoan;
	}

	public Collection<Ve> getVeList() {
		return veList;
	}

	public void setVeList(Collection<Ve> veList) {
		this.veList = veList;
	}
	
	public String getAvatar() {
		return avatar;
	}
	
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
}


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
@Table(name="NHAN_VIEN")
public class NhanVien {
	@Id
	@Column(name="MaNV")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer maNV;// Mã nhân viên - int tự tăng
	
	@Column(name="TenNV")
	private String tenNV; // Tên nhân viên - nvarchar(50)
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern="MM/dd/yyyy")
	@Column(name="NgaySinh")	
	private Date ngaySinh; // Ngày sinh - date
	
	@Column(name="CMND")	
	private String cmnd; // Chứng minh nhân dân - varchar(12)
	
	@Column(name="SDT")	
	private String soDT; // Số điện thoại - varchar(10)

	@Column(name="DiaChi")
	private String diaChi; // Địa chỉ nơi ở - nvarchar(50)
	
	@Column(name="GioiTinh")
	private Boolean gioiTinh; // Giới tính - bit
	
	@OneToMany(mappedBy="nhanVien")
	@LazyCollection(LazyCollectionOption.FALSE)
	private Collection<Ve> veList;
	
	@Column(name="TrangThai")
	private Boolean trangThai; // Trạng thái hoạt động - bit
	
	@ManyToOne
	@JoinColumn(name="email")
	private TaiKhoan dstaikhoan;
	
    @ManyToOne
    @JoinColumn(name = "MaChiNhanh")
    private ChiNhanh chiNhanh;
    
	public NhanVien() {
		// TODO Auto-generated constructor stub
	}
	
	
	/*public NhanVien(Integer maNV, String tenNV, Date ngaySinh, String cmnd, String soDT, String diaChi, Boolean gioiTinh,
			String email, Boolean trangThai) {
		super();
		this.maNV = maNV;
		this.tenNV = tenNV;
		this.ngaySinh = ngaySinh;
		this.cmnd = cmnd;
		this.soDT = soDT;
		this.diaChi = diaChi;
		this.gioiTinh = gioiTinh;
		this.email = email;
		this.trangThai = trangThai;
	}*/

	public Integer getMaNV() {
		return maNV;
	}

	public void setMaNV(Integer maNV) {
		this.maNV = maNV;
	}

	public String getTenNV() {
		return tenNV;
	}

	public void setTenNV(String tenNV) {
		this.tenNV = tenNV;
	}

	public Date getNgaySinh() {
		return ngaySinh;
	}

	public void setNgaySinh(Date ngaySinh) {
		this.ngaySinh = ngaySinh;
	}

	public String getCmnd() {
		return cmnd;
	}

	public void setCmnd(String cmnd) {
		this.cmnd = cmnd;
	}

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

	public Boolean getTrangThai() {
		return trangThai;
	}

	public void setTrangThai(Boolean trangThai) {
		this.trangThai = trangThai;
	}

	public Collection<Ve> getVeList() {
		return veList;
	}

	public void setVeList(Collection<Ve> veList) {
		this.veList = veList;
	}
	
	public ChiNhanh getChiNhanh() {
		return chiNhanh;
	}
	
	public void setChiNhanh(ChiNhanh chiNhanh) {
		this.chiNhanh = chiNhanh;
	}
}

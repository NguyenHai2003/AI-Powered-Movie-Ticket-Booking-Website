package poly.entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import jakarta.validation.constraints.NotEmpty;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;



@Entity
@Table(name="TAIKHOAN")
public class TaiKhoan {
    @Id
    @NotNull(message="Email không được để trống!")
    @NotEmpty(message="Email không được để trống!")
    @Column(name="Email")
    private String email; // Email - varchar(50)
    
    @NotEmpty(message="Password không được để trống!")
    @Column(name="Password")
    private String password; // Mật khẩu - char(8)
  
	@ManyToOne
	@JoinColumn(name="maQuyen")
	private Quyen quyen;

	public TaiKhoan() {
		super();
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Quyen getQuyen() {
		return quyen;
	}

	public void setQuyen(Quyen quyen) {
		this.quyen = quyen;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	@OneToMany(mappedBy="dstaikhoan")
	@LazyCollection(LazyCollectionOption.FALSE)
	private Collection<NhanVien> nhanvienlist;
	
	@OneToMany(mappedBy="dstaikhoan")
	@LazyCollection(LazyCollectionOption.FALSE)
	private Collection<KhachHang> khachhanglist;
	
	public Collection<NhanVien> getNhanvienlist() {
		return nhanvienlist;
	}

	public void setNhanvienlist(Collection<NhanVien> nhanvienlist) {
		this.nhanvienlist = nhanvienlist;
	}

	public Collection<KhachHang> getKhachhanglist() {
		return khachhanglist;
	}

	public void setKhachhanglist(Collection<KhachHang> khachhanglist) {
		this.khachhanglist = khachhanglist;
	}
}

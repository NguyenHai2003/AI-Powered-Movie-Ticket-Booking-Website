package poly.entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="QUYEN")
public class Quyen {
	@Id
	@Column(name="MaQuyen")
	private String maQuyen; // Mã quyền - varchar(10)
	
	@Column(name="TenQuyen")
	private String tenQuyen; // Tên quyền - nvarchar(50)
	
	@OneToMany(mappedBy="quyen", fetch=FetchType.EAGER)
	private Collection<TaiKhoan> TaiKhoanS ;
	
	public Quyen() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Quyen(String maQuyen, String tenQuyen) {
		super();
		this.maQuyen = maQuyen;
		this.tenQuyen = tenQuyen;
	}

	public String getMaQuyen() {
		return maQuyen;
	}

	public void setMaQuyen(String maQuyen) {
		this.maQuyen = maQuyen;
	}

	public String getTenQuyen() {
		return tenQuyen;
	}

	public void setTenQuyen(String tenQuyen) {
		this.tenQuyen = tenQuyen;
	}
	
	public Collection<TaiKhoan> getTaiKhoanS() {
		return TaiKhoanS;
	}

	public void setTaiKhoanS(Collection<TaiKhoan> taiKhoanS) {
		TaiKhoanS = taiKhoanS;
	}
}

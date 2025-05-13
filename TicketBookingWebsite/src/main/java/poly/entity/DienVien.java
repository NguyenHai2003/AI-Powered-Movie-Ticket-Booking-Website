package poly.entity;

import javax.persistence.*;
import java.util.Collection;

@Entity
@Table(name = "DIENVIEN")
public class DienVien {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "IdDienVien")
    private int idDienVien;

    @Column(name = "TenDienVien", length = 100)
    private String tenDienVien;

    @Column(name = "AnhDienVien", length = 8000)
    private String anhDienVien;

    @OneToMany(mappedBy = "dienvien", fetch=FetchType.EAGER)
    private Collection<VaiDien> vaiDiens;
    
    public Collection<VaiDien> getVaiDiens() {
        return vaiDiens;
    }

	public void setVaiDiens(Collection<VaiDien> vaiDiens) {
		this.vaiDiens = vaiDiens;
	}
	
	public DienVien() {}
	
	public DienVien(int idDienVien, String tenDienVien, String anhDienVien) {
		this.idDienVien = idDienVien;
		this.tenDienVien = tenDienVien;
		this.anhDienVien = anhDienVien;
	}
	
	public int getIdDienVien() {
		return idDienVien;
	}
	
	public void setIdDienVien(int idDienVien) {
		this.idDienVien = idDienVien;
	}
	
	public String getTenDienVien() {
		return tenDienVien;
	}
	
	public void setTenDienVien(String tenDienVien) {
		this.tenDienVien = tenDienVien;
	}
	
	public String getAnhDienVien() {
		return anhDienVien;
	}
	
	public void setAnhDienVien(String anhDienVien) {
		this.anhDienVien = anhDienVien;
	}
}

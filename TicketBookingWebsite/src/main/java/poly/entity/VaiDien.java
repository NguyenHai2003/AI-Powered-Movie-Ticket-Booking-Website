package poly.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="VAIDIEN")
@IdClass(VaiDienPK.class)
public class VaiDien implements Serializable{
	private static final long serialVersionUID = 1L;

    @Id
    @ManyToOne
    @JoinColumn(name="IdDienVien")
    private DienVien dienvien;

    @Id
    @ManyToOne
    @JoinColumn(name="MaPhim")
    private Phim phim;
    
    @Column(name="TenVaiDien")
    private String tenVaiDien;

    public VaiDien() {
        // Default constructor
    }
    
    public DienVien getDienVien() {
        return dienvien;
    }

    public void setDienVien(DienVien dienvien) {
        this.dienvien = dienvien;
    }

    public Phim getPhim() {
        return phim;
    }

    public void setPhim(Phim phim) {
        this.phim = phim;
    }

    public VaiDien(DienVien dienvien, Phim phim) {
        this.dienvien = dienvien;
        this.phim = phim;
    }
    
    public String getTenVaiDien() {
    	return tenVaiDien;
    }
    
    public void setTenVaiDien(String tenVaiDien) {
    	this.tenVaiDien = tenVaiDien;
    }
}
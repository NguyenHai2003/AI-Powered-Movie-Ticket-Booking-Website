package poly.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "SUKIEN")
public class SuKien {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaSK")
    private int maSK;
    @Column(name = "TenSK")
    private String tenSK;
    @Column(name = "MoTaSK")
    private String moTaSK;
    @Column(name = "ChiTietSK")
    private String ctSK;
    @Column(name = "PosterSK")
    private String posterSK;
    public SuKien() {}

    public SuKien(int maSK, String tenSK, String moTaSK, String ctSK, String posterSK) {
    	this.maSK = maSK;
    	this.tenSK = tenSK;
    	this.moTaSK = moTaSK;
    	this.ctSK = ctSK;
    	this.posterSK = posterSK;
    }
    
    public void setMaSK(int maSK) {
    	this.maSK = maSK;
    }
    
    public int getMaSK() {
    	return maSK;
    }
    
    public void setTenSK(String tenSK) {
    	this.tenSK = tenSK;
    }
    
    public String getTenSK() {
    	return tenSK;
    }
    
    public void setMoTaSK(String moTaSK) {
    	this.moTaSK = moTaSK;
    }
    
    public String getMoTaSK(){
    	return moTaSK;
    }
    
    public String getCTSK(){
    	return ctSK;
    }
    
    public void setCTSK(String ctSK) {
    	this.ctSK = ctSK;
    }
    
    public void setPosterSK(String posterSK) {
    	this.posterSK = posterSK;
    }
    
    public String getPosterSK(){
    	return posterSK;
    }
}
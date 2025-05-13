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
@Table(name="CHITIET_THAYDOIGIA")
@IdClass(ThayDoiGiaPK.class)
public class ChiTietThayDoiGia implements Serializable{
	private static final long serialVersionUID = 1L;

    @Id
    @ManyToOne
    @JoinColumn(name="IdThayDoi")
    private ThayDoiGia thaydoigia;

    @Id
    @ManyToOne
    @JoinColumn(name="MaSuatChieu")
    private LichChieu dsLichChieu;
    
    @Column(name="PhanTramThayDoi")
    private float phanTramThayDoi;

    public ChiTietThayDoiGia() {
        // Default constructor
    }
    
    public ThayDoiGia getThayDoiGia() {
        return thaydoigia;
    }

    public void setThayDoiGia(ThayDoiGia thaydoigia) {
        this.thaydoigia = thaydoigia;
    }

    public LichChieu getLichChieu() {
        return dsLichChieu;
    }

    public void setLichChieu(LichChieu dsLichChieu) {
        this.dsLichChieu = dsLichChieu;
    }

    public ChiTietThayDoiGia(LichChieu dsLichChieu, ThayDoiGia thaydoigia) {
        this.dsLichChieu = dsLichChieu;
        this.thaydoigia = thaydoigia;
    }
    
    public float getPhamTramThayDoi() {
    	return phanTramThayDoi;
    }
    
    public void setPhamTramThayDoi(float phanTramThayDoi) {
    	this.phanTramThayDoi = phanTramThayDoi;
    }
}
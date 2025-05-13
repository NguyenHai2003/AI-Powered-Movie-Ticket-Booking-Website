package poly.entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
@Table(name="PHONG")
public class PhongChieu {
	@Id
	@Column(name="MaPhong")
	private String maPhong; // Mã phòng chiếu - varchar(10)
	
	@Column(name="TrangThai")
	private Boolean trangThai; // Trạng thái phòng chiếu - bit
	
	@OneToMany(mappedBy="dsPhong")
	@LazyCollection(LazyCollectionOption.FALSE)
	private Collection<LichChieu> lichChieuList;
	
    @ManyToOne
    @JoinColumn(name = "MaChiNhanh")
    private ChiNhanh chiNhanh;
    
    @Transient
    private long tongSoGhe;
    
	public PhongChieu() {
		// TODO Auto-generated constructor stub
	}

	public PhongChieu(String maPhong, Boolean trangThai, Integer tongSoGhe) {
		super();
		this.maPhong = maPhong;
		this.trangThai = trangThai;
	}

	public String getMaPhong() {
		return maPhong;
	}

	public void setMaPhong(String maPhong) {
		this.maPhong = maPhong;
	}

	public Collection<LichChieu> getLichChieuList() {
		return lichChieuList;
	}

	public void setLichChieuList(Collection<LichChieu> lichChieuList) {
		this.lichChieuList = lichChieuList;
	}

	public Boolean getTrangThai() {
		return trangThai;
	}

	public void setTrangThai(Boolean trangThai) {
		this.trangThai = trangThai;
	}
	
    public long getTongSoGhe() {
        return tongSoGhe;
    }

    public void setTongSoGhe(long tongSoGhe) {
        this.tongSoGhe = tongSoGhe;
    }
    
	public ChiNhanh getChiNhanh() {
		return chiNhanh;
	}
	
	public void setChiNhanh(ChiNhanh chiNhanh) {
		this.chiNhanh = chiNhanh;
	}
}

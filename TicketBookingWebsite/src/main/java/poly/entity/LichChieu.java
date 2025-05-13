package poly.entity;
import java.sql.Time;
import java.text.SimpleDateFormat;
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
import javax.persistence.Transient;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="LICH_CHIEU")
public class LichChieu {
	@Id
	@Column(name="MaSuatChieu")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer maSC;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern="MM/dd/yyyy")
	@Column(name="NgayChieu")
	private Date ngayChieu;
	
	@Column(name="GioChieu")
	private Time gioChieu;
	
	@ManyToOne
	@JoinColumn(name="MaPhong")
	private PhongChieu dsPhong;
	
	@ManyToOne
	@JoinColumn(name="MaPhim")
	private Phim dsPhim;
	
	@OneToMany(mappedBy="dsLichChieu")
	@LazyCollection(LazyCollectionOption.FALSE)
	private Collection<Ve> veList;
	
	@OneToMany(mappedBy = "dsLichChieu")
    @LazyCollection(LazyCollectionOption.FALSE)
    private Collection<ChiTietThayDoiGia> thayDoiGia;
    
    public Collection<ChiTietThayDoiGia> getThayDoiGia() {
        return thayDoiGia;
    }

	public void setThayDoiGia(Collection<ChiTietThayDoiGia> thayDoiGia) {
		this.thayDoiGia = thayDoiGia;
	}
	
	@Transient
	private String trangThai;
	
	public String getTrangThai() {
		return trangThai;
	}
	
	public void setTrangThai(String trangThai) {
		this.trangThai = trangThai;
	}
	
	public PhongChieu getDsPhong() {
		return dsPhong;
	}

	public void setDsPhong(PhongChieu dsPhong) {
		this.dsPhong = dsPhong;
	}

	public Phim getDsPhim() {
		return dsPhim;
	}

	public void setDsPhim(Phim dsPhim) {
		this.dsPhim = dsPhim;
	}

	public LichChieu() {
		// TODO Auto-generated constructor stub
	}

	public LichChieu(Integer maSC, Date ngayChieu, Time gioChieu) {
		super();
		this.maSC = maSC;
		this.ngayChieu = ngayChieu;
		this.gioChieu = gioChieu;
	}

	public Integer getMaSC() {
		return maSC;
	}

	public void setMaSC(Integer maSC) {
		this.maSC = maSC;
	}

	public Date getNgayChieu() {
		return ngayChieu;
	}

	public void setNgayChieu(Date ngayChieu) {
		this.ngayChieu = ngayChieu;
	}

	public Time getGioChieu() {
		return gioChieu;
	}

	public void setGioChieu(Time gioChieu) {
		this.gioChieu = gioChieu;
	}
	
    public String getFormattedGioChieu() {
        SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
        return timeFormat.format(this.gioChieu);
    }

	public Collection<Ve> getVeList() {
		return veList;
	}

	public void setVeList(Collection<Ve> veList) {
		this.veList = veList;
	}
	
}

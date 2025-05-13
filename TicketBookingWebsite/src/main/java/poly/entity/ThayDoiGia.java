package poly.entity;

import javax.persistence.*;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import java.util.Collection;
import java.util.Date;

@Entity
@Table(name = "THAYDOIGIA")
public class ThayDoiGia {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "IdThayDoiGia")
    private int idThayDoi;

    @Column(name = "LyDoThayDoi")
    private String lyDo;

    @Column(name = "NgayThayDoi")
    private Date ngayThayDoi;

    @OneToMany(mappedBy = "thaydoigia")
    @LazyCollection(LazyCollectionOption.FALSE)
    private Collection<ChiTietThayDoiGia> thayDoiGia;

    public ThayDoiGia() {}

    public int getIdThayDoi() {
        return idThayDoi;
    }

    public void setIdThayDoi(int idThayDoi) {
        this.idThayDoi = idThayDoi;
    }

    public String getLyDo() {
        return lyDo;
    }

    public void setLyDo(String lyDo) {
        this.lyDo = lyDo;
    }

    public Date getNgayThayDoi() {
        return ngayThayDoi;
    }

    public void setNgayThayDoi(Date ngayThayDoi) {
        this.ngayThayDoi = ngayThayDoi;
    }

    public Collection<ChiTietThayDoiGia> getThayDoiGia() {
        return thayDoiGia;
    }

    public void setThayDoiGia(Collection<ChiTietThayDoiGia> thayDoiGia) {
        this.thayDoiGia = thayDoiGia;
    }
}

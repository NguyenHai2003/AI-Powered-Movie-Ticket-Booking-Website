package poly.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "LOAIGHE")
public class LoaiGhe {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "IdLoaiGhe")
    private Integer idLoaiGhe;

    @Column(name = "TenLoai")
    private String tenLoai;

    @Column(name = "Gia")
    private Double gia;

    @OneToMany(mappedBy = "loaiGhe")
    private List<ChiTietGhePhong> gheList;

    // Constructors
    public LoaiGhe() {}

    // Getters and setters
    public Integer getIdLoaiGhe() {
        return idLoaiGhe;
    }

    public void setIdLoaiGhe(Integer idLoaiGhe) {
        this.idLoaiGhe = idLoaiGhe;
    }

    public String getTenLoai() {
        return tenLoai;
    }

    public void setTenLoai(String tenLoai) {
        this.tenLoai = tenLoai;
    }

    public Double getGia() {
        return gia;
    }

    public void setGia(Double gia) {
        this.gia = gia;
    }

    public List<ChiTietGhePhong> getGheList() {
        return gheList;
    }

    public void setGheList(List<ChiTietGhePhong> gheList) {
        this.gheList = gheList;
    }
}

package poly.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "GHE")
public class Ghe {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "IdGhe")
    private Integer idGhe;

    @Column(name = "TenGhe")
    private String tenGhe;

    @OneToMany(mappedBy = "ghe")
    private List<ChiTietGhePhong> chiTietGhePhongList;

    // Constructors
    public Ghe() {}

    // Getters and setters
    public Integer getIdGhe() {
        return idGhe;
    }

    public void setIdGhe(Integer idGhe) {
        this.idGhe = idGhe;
    }

    public String getTenGhe() {
        return tenGhe;
    }

    public void setTenGhe(String tenGhe) {
        this.tenGhe = tenGhe;
    }

    public List<ChiTietGhePhong> getChiTietGhePhongList() {
        return chiTietGhePhongList;
    }

    public void setChiTietGhePhongList(List<ChiTietGhePhong> chiTietGhePhongList) {
        this.chiTietGhePhongList = chiTietGhePhongList;
    }
}

package poly.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "CHITIET_GHE_PHONG")
public class ChiTietGhePhong {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "IdGheDat")
    private Integer idGheDat;

    @ManyToOne
    @JoinColumn(name = "IdGhe")
    private Ghe ghe;

    @ManyToOne
    @JoinColumn(name = "MaPhong", referencedColumnName = "MaPhong")
    private PhongChieu phong;  // Updated field
    
    @ManyToOne
    @JoinColumn(name = "IdLoaiGhe")
    private LoaiGhe loaiGhe;

    @OneToMany(mappedBy = "chiTietGhePhong")
    private List<Ve> veList;

    // Constructors
    public ChiTietGhePhong() {}

    // Getters and setters
    public Integer getIdGheDat() {
        return idGheDat;
    }

    public void setIdGheDat(Integer idGheDat) {
        this.idGheDat = idGheDat;
    }

    public Ghe getGhe() {
        return ghe;
    }

    public void setGhe(Ghe ghe) {
        this.ghe = ghe;
    }

    public PhongChieu getPhong() {  // Updated getter
        return phong;
    }

    public void setPhong(PhongChieu phong) {  // Updated setter
        this.phong = phong;
    }

    public List<Ve> getVeList() {
        return veList;
    }

    public void setVeList(List<Ve> veList) {
        this.veList = veList;
    }
    
    public LoaiGhe getLoaiGhe() {
        return loaiGhe;
    }

    public void setLoaiGhe(LoaiGhe loaiGhe) {
        this.loaiGhe = loaiGhe;
    }
}

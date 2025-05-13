package poly.entity;

import javax.persistence.*;
import java.util.Collection;

@Entity
@Table(name = "DAODIEN")
public class DaoDien {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "IdDaoDien")
    private int idDaoDien;

    @Column(name = "TenDaoDien", length = 50)
    private String tenDaoDien;

    @Column(name = "AnhDaoDien", length = 1000)
    private String anh;

    @OneToMany(mappedBy = "daoDien")
    private Collection<Phim> phimList;

    // Constructors
    public DaoDien() {}

    // Getters and Setters
    public int getIdDaoDien() {
        return idDaoDien;
    }

    public void setIdDaoDien(int idDaoDien) {
        this.idDaoDien = idDaoDien;
    }

    public String getTenDaoDien() {
        return tenDaoDien;
    }

    public void setTenDaoDien(String tenDaoDien) {
        this.tenDaoDien = tenDaoDien;
    }

    public String getAnh() {
        return anh;
    }

    public void setAnh(String anh) {
        this.anh = anh;
    }

    public Collection<Phim> getPhimList() {
        return phimList;
    }

    public void setPhimList(Collection<Phim> phimList) {
        this.phimList = phimList;
    }
}

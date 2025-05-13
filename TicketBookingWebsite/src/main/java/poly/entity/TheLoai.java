package poly.entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="THE_LOAI")
public class TheLoai {
    @Id
    @Column(name="MaTL")
    private int maTL;

    @Column(name="TenTL")
    private String tenTL;

    @OneToMany(mappedBy="theLoai", fetch=FetchType.EAGER) // Corrected mappedBy
    private Collection<ChiTietTheLoai> chiTietTheLoais; // Corrected type

    public Collection<ChiTietTheLoai> getChiTietTheLoais() {
        return chiTietTheLoais;
    }

    public void setChiTietTheLoais(Collection<ChiTietTheLoai> chiTietTheLoais) {
        this.chiTietTheLoais = chiTietTheLoais;
    }

    public TheLoai() {
        // Default constructor
    }

    public TheLoai(int maTL, String tenTL) {
        this.maTL = maTL;
        this.tenTL = tenTL;
    }

    public int getMaTL() {
        return maTL;
    }

    public void setMaTL(int maTL) {
        this.maTL = maTL;
    }

    public String getTenTL() {
        return tenTL;
    }

    public void setTenTL(String tenTL) {
        this.tenTL = tenTL;
    }
}

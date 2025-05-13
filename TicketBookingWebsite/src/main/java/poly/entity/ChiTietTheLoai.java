package poly.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="THE_LOAI_PHIM")
@IdClass(TheLoaiPK.class)
public class ChiTietTheLoai implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @ManyToOne
    @JoinColumn(name="MaTL")
    private TheLoai theLoai; // Corrected type

    @Id
    @ManyToOne
    @JoinColumn(name="MaPhim")
    private Phim phim;

    public ChiTietTheLoai() {
        // Default constructor
    }

    public TheLoai getTheLoai() {
        return theLoai;
    }

    public void setTheLoai(TheLoai theLoai) {
        this.theLoai = theLoai;
    }

    public Phim getPhim() {
        return phim;
    }

    public void setPhim(Phim phim) {
        this.phim = phim;
    }

    public ChiTietTheLoai(TheLoai theLoai, Phim phim) {
        this.theLoai = theLoai;
        this.phim = phim;
    }        
}
package poly.entity;

import java.io.Serializable;
import java.util.Objects;

public class TheLoaiPK implements Serializable {
    private static final long serialVersionUID = 1L;
    protected TheLoai theLoai; // Corrected type
    protected Phim phim; // Corrected type

    public TheLoaiPK() {}

    public TheLoaiPK(TheLoai theLoai, Phim phim) {
        this.theLoai = theLoai;
        this.phim = phim;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
        TheLoaiPK that = (TheLoaiPK) obj;
        return Objects.equals(theLoai, that.theLoai) &&
               Objects.equals(phim, that.phim);
    }

    @Override
    public int hashCode() {
        return Objects.hash(theLoai, phim);
    }
}
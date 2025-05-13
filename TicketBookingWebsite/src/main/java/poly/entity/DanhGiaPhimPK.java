package poly.entity;

import java.io.Serializable;
import java.util.Objects;

public class DanhGiaPhimPK implements Serializable {
    private static final long serialVersionUID = 1L;
    protected KhachHang khachhang; // Corrected type
    protected Phim phim; // Corrected type

    public DanhGiaPhimPK() {}

    public DanhGiaPhimPK(KhachHang khachhang, Phim phim) {
        this.khachhang = khachhang;
        this.phim = phim;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
        DanhGiaPhimPK that = (DanhGiaPhimPK) obj;
        return Objects.equals(khachhang, that.khachhang) &&
               Objects.equals(phim, that.phim);
    }

    @Override
    public int hashCode() {
        return Objects.hash(khachhang, phim);
    }
}

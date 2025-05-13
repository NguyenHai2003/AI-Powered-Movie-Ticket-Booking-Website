package poly.entity;

import java.io.Serializable;
import java.util.Objects;

public class VaiDienPK implements Serializable {
    private static final long serialVersionUID = 1L;
    protected DienVien dienvien; // Corrected type
    protected Phim phim; // Corrected type

    public VaiDienPK() {}

    public VaiDienPK(DienVien dienvien, Phim phim) {
        this.dienvien = dienvien;
        this.phim = phim;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
        VaiDienPK that = (VaiDienPK) obj;
        return Objects.equals(dienvien, that.dienvien) &&
               Objects.equals(phim, that.phim);
    }

    @Override
    public int hashCode() {
        return Objects.hash(dienvien, phim);
    }
}

package poly.entity;

import java.io.Serializable;
import java.util.Objects;


public class ThayDoiGiaPK implements Serializable {
    private static final long serialVersionUID = 1L;
    protected LichChieu dsLichChieu; // Corrected type
    protected ThayDoiGia thaydoigia; // Corrected type

    public ThayDoiGiaPK() {}

    public ThayDoiGiaPK(LichChieu dsLichChieu, ThayDoiGia thaydoigia) {
        this.dsLichChieu = dsLichChieu;
        this.thaydoigia = thaydoigia;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
        ThayDoiGiaPK that = (ThayDoiGiaPK) obj;
        return Objects.equals(dsLichChieu, that.dsLichChieu) &&
               Objects.equals(thaydoigia, that.thaydoigia);
    }

    @Override
    public int hashCode() {
        return Objects.hash(dsLichChieu, thaydoigia);
    }
}
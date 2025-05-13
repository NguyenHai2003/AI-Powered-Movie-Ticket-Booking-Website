package poly.bean;

import java.util.List;

public class TicketRequest {
	private List<Integer> idGheDat;
    private int maSuatChieu;

    // Getters and setters
    public List<Integer> getIdGheDat() {
        return idGheDat;
    }

    public void setIdGheDat(List<Integer> idGheDat) {
        this.idGheDat = idGheDat;
    }

    public int getMaSuatChieu() {
        return maSuatChieu;
    }

    public void setMaSuatChieu(int maSuatChieu) {
        this.maSuatChieu = maSuatChieu;
    }

}

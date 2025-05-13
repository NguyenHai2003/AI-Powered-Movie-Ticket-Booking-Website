package poly.bean;

import java.util.List;

public class SeatStatusUpdateRequest {
    private List<String> seatNames;
    private Boolean trangThaiDat;

    // Getters và setters
    public List<String> getSeatNames() {
        return seatNames;
    }

    public void setSeatNames(List<String> seatNames) {
        this.seatNames = seatNames;
    }

    public Boolean getTrangThaiDat() {
        return trangThaiDat;
    }

    public void setTrangThaiDat(Boolean trangThaiDat) {
        this.trangThaiDat = trangThaiDat;
    }
}


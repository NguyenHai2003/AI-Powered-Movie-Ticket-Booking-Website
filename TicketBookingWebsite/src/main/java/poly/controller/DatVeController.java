package poly.controller;

import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import poly.entity.ChiNhanh;
import poly.entity.LichChieu;
import poly.entity.Phim;

@Transactional
@Controller
public class DatVeController {
    @Autowired
    private SessionFactory factory;

    @RequestMapping(value = "/datve/{ngay}.htm", method = RequestMethod.GET)
    public String datve(ModelMap model, @PathVariable("ngay") String ngay, 
                        @RequestParam(value = "chinhanh") Integer maChiNhanh) {
        Date date = null;
        try {
            if (ngay != null) {
                date = new SimpleDateFormat("yyyy-MM-dd").parse(ngay.trim());
            } else {
                date = new Date();
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }

        List<LichChieu> list = layTatCaLichChieu();
        List<LichChieu> filteredList = new ArrayList<>();
        SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");

        // Lọc lịch chiếu theo chi nhánh
        for (LichChieu lc : list) {
            if (lc.getDsPhong().getChiNhanh().getMaChiNhanh() == maChiNhanh) {
                if (lc.getNgayChieu().compareTo(date) == 0) {
                    if (lc.getNgayChieu().after(new Date())) {
                        filteredList.add(lc);
                    } else {
                        Time currentTime = Time.valueOf(LocalTime.now());
                        if (lc.getGioChieu().after(currentTime)) {
                            filteredList.add(lc);
                        }
                    }
                }
            }
        }
        
        filteredList.sort(Comparator.comparing(LichChieu::getGioChieu));
        model.addAttribute("formattedGioChieu", filteredList.stream()
                .map(lc -> timeFormat.format(lc.getGioChieu()))
                .toList());
        model.addAttribute("phimListDangChieu", getMoviesFromLichChieu(filteredList));
        model.addAttribute("lc", filteredList);
        model.addAttribute("day", LocalDate.now());

        // Truyền danh sách chi nhánh vào model để hiển thị trong view
        List<ChiNhanh> chiNhanhList = getAllChiNhanh();
        model.addAttribute("chiNhanhList", chiNhanhList);

        return "datve";
    }



    public List<ChiNhanh> getAllChiNhanh() {
        Session session = factory.getCurrentSession();
        String hql = "FROM ChiNhanh";
        Query query = session.createQuery(hql);
        @SuppressWarnings("unchecked")
        List<ChiNhanh> list = query.list();
        return list;
    }


    // Phim đang chiếu
    public List<Phim> getMoviesDangChieu() {
        Session session = factory.getCurrentSession();
        String hql = "FROM Phim WHERE NgayKhoiChieu <= :currentDate AND maTT = :maTT";
        Query query = session.createQuery(hql);
        query.setParameter("currentDate", new Date());
        query.setParameter("maTT", 1);
        @SuppressWarnings("unchecked")
        List<Phim> list = query.list();
        return list;
    }

    public List<LichChieu> layLichChieu(Integer maPhim) {
        Session session = factory.getCurrentSession();
        String hql = "FROM LichChieu WHERE dsPhim.maPhim = :maPhim";
        Query query = session.createQuery(hql);
        query.setParameter("maPhim", maPhim);
        @SuppressWarnings("unchecked")
        List<LichChieu> list = query.list();
        return list;
    }
    
    public List<LichChieu> layTatCaLichChieu() {
        Session session = factory.getCurrentSession();
        String hql = "FROM LichChieu";
        Query query = session.createQuery(hql);
        @SuppressWarnings("unchecked")
        List<LichChieu> list = query.list();
        return list;
    }

    public Phim layPhim(Integer maPhim) {
        Session session = factory.getCurrentSession();
        return (Phim) session.get(Phim.class, maPhim);
    }

    public List<Phim> getMoviesFromLichChieu(List<LichChieu> danhSachLichChieu) {
        Set<Integer> maPhimSet = new HashSet<>();
        for (LichChieu lichChieu : danhSachLichChieu) {
            maPhimSet.add(lichChieu.getDsPhim().getMaPhim());
        }

        List<Phim> danhSachPhim = new ArrayList<>();
        for (Integer maPhim : maPhimSet) {
            Phim phim = layPhim(maPhim);
            if (phim != null) {
                danhSachPhim.add(phim);
            }
        }
        return danhSachPhim;
    }
}

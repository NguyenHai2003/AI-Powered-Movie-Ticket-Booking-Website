package poly.controller;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import poly.entity.*;

@Transactional
@Controller
public class PhimController {
    @Autowired
    SessionFactory factory;
    @RequestMapping("phimsapchieu")
    public String list(@RequestParam(value = "tab", required = false, defaultValue = "home") String tab, ModelMap model) {
        List<Phim> phimListSapChieu = getMoviesSapChieu();
        model.addAttribute("phimListSapChieu", phimListSapChieu);

        List<Phim> phimListDangChieu = getMoviesDangChieu();
        model.addAttribute("phimListDangChieu", phimListDangChieu);

        model.addAttribute("tab", tab); // Thêm thuộc tính tab để xác định tab nào sẽ được hiển thị
        model.addAttribute("user", LoginController.kh);
        String currentDate = new SimpleDateFormat("dd-MM-yyyy").format(new Date());
        model.addAttribute("currentDate", currentDate);
        return "phimsapchieu"; // Chỉ định file JSP là phimsapchieu.jsp
    }

    // Phim sắp chiếu
    public List<Phim> getMoviesSapChieu() {
        Session session = factory.getCurrentSession();
        String hql = "FROM Phim WHERE NgayKhoiChieu > :currentDate AND MaTT = 2";
        Query query = session.createQuery(hql);
        query.setParameter("currentDate", new Date());
        @SuppressWarnings("unchecked")
        List<Phim> list = query.list();
        return list;
    }

    // Phim đang chiếu
    public List<Phim> getMoviesDangChieu() {
        Session session = factory.getCurrentSession();
        String hql = "FROM Phim WHERE NgayKhoiChieu <= :currentDate AND MaTT = 1";
        Query query = session.createQuery(hql);
        query.setParameter("currentDate", new Date());
        @SuppressWarnings("unchecked")
        List<Phim> list = query.list();
        return list;
    }
}

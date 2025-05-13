package poly.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.type.StandardBasicTypes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.entity.*;

@Transactional
@Controller
@RequestMapping("/")
public class TrangChuController {
    
    @Autowired
    SessionFactory factory;

    @RequestMapping("trangchu")
    public String list(ModelMap model) {
    	updateMovieStatus();
    	List<Phim> phimList = getMovies();
        model.addAttribute("phimList", phimList);
        
    	List<Phim> phimListHot = getMoviesHot();
        model.addAttribute("phimListHot", phimListHot);
        
    	List<Phim> phimListNew = getMoviesNew();
        model.addAttribute("phimListNew", phimListNew);
        
    	List<SuKien> sukienList = getSuKien();
        model.addAttribute("sukienList", sukienList);
        
    	List<Phim> phimListDangChieu = getMoviesDangChieu();
        model.addAttribute("phimListDangChieu", phimListDangChieu);
        
    	List<Phim> phimListSapChieu = getMoviesSapChieu();
        model.addAttribute("phimListSapChieu", phimListSapChieu);
        
    	List<DaoDien> DaoDienList = getListDaoDien();
        model.addAttribute("DaoDienList", DaoDienList);
        
        model.addAttribute("user", LoginController.kh);
        
        // Add current date to model
        String currentDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        model.addAttribute("currentDate", currentDate);
        
        Map<Integer, Object[]> thongKeDanhGiaMap = new HashMap<>();
        for (Phim phim : phimList) {
            Object[] thongKe = thongKeDanhGiaTheoPhim(phim.getMaPhim());
            thongKeDanhGiaMap.put(phim.getMaPhim(), thongKe);
        }
        
        model.addAttribute("thongKeDanhGiaMap", thongKeDanhGiaMap);
        
        Object[] phimBanChayNhat = getTopMovie(); // Chỉ lấy 1 phim
        model.addAttribute("phimBanChayNhat", phimBanChayNhat);
        return "trangchu";
    }
    
    public void updateMovieStatus() {
        Session session = factory.getCurrentSession();
        String sql = "{CALL SP_CapNhatTrangThaiPhim}";
        Query query = session.createSQLQuery(sql);
        query.executeUpdate(); // Thực thi stored procedure
    }
    
    public Object[] getTopMovie() {
        Session session = factory.getCurrentSession();
        String sql = "{CALL ThongKePhimBanChayNhat}";
        Query query = session.createSQLQuery(sql)
                             .addScalar("MaPhim", StandardBasicTypes.INTEGER)
                             .addScalar("TenPhim", StandardBasicTypes.STRING) // Ánh xạ kiểu dữ liệu
                             .addScalar("SoLuongVe", StandardBasicTypes.INTEGER);
        
        List<Object[]> resultList = query.list();
        if (!resultList.isEmpty()) {
            return resultList.get(0); // Lấy phim đầu tiên
        }
        return null;
    }

    
    public Object[] thongKeDanhGiaTheoPhim(int maPhim) {
        Session session = factory.getCurrentSession();
        String hql = "{CALL ThongKeDanhGiaTheoPhim(:maPhim)}";
        Query query = session.createSQLQuery(hql)
                             .setParameter("maPhim", maPhim);
        List<Object[]> resultList = query.list();
        if (!resultList.isEmpty()) {
            return resultList.get(0);
        }
        return null;
    }

    //All phim
    public List<Phim> getMovies() {
   	 Session session = factory.getCurrentSession();
        String hql = "FROM Phim";
        Query query = session.createQuery(hql);
        @SuppressWarnings("unchecked")
        List<Phim> list = query.list();
        return list;
   }
    
    //3 phim hot nhất 
    public List<Phim> getMoviesHot() {
   	 Session session = factory.getCurrentSession();
        String hql = "FROM Phim ORDER BY Diem DESC";
        Query query = session.createQuery(hql);
        query.setMaxResults(3);
        @SuppressWarnings("unchecked")
        List<Phim> list = query.list();
        return list;
   }
   
    //6 phim mới nhất
    public List<Phim> getMoviesNew() {
      	 Session session = factory.getCurrentSession();
           String hql = "FROM Phim WHERE MaTT != 0 ORDER BY NgayKhoiChieu DESC";
           Query query = session.createQuery(hql);
           @SuppressWarnings("unchecked")
           List<Phim> list = query.list();
           return list;
      }
    
    //Sự kiện
    public List<SuKien> getSuKien() {
      	 Session session = factory.getCurrentSession();
           String hql = "FROM SuKien";
           Query query = session.createQuery(hql);
           @SuppressWarnings("unchecked")
           List<SuKien> list = query.list();
           return list;
      }
    
  //Phim đang chiếu
    public List<Phim> getMoviesDangChieu() {
      	 Session session = factory.getCurrentSession();
           String hql = "FROM Phim WHERE NgayKhoiChieu <= :currentDate AND MaTT = 1";
           Query query = session.createQuery(hql);
           query.setParameter("currentDate", new Date());
           @SuppressWarnings("unchecked")
           List<Phim> list = query.list();
           return list;
    }
    
    //Phim sắp chiếu
    public List<Phim> getMoviesSapChieu() {
    	Session session = factory.getCurrentSession();
        String hql = "FROM Phim WHERE NgayKhoiChieu > :currentDate AND MaTT = 2";
        Query query = session.createQuery(hql);
        query.setParameter("currentDate", new Date());
        @SuppressWarnings("unchecked")
        List<Phim> list = query.list();
        return list;
   }
    
   public List<DaoDien> getListDaoDien(){
	   	Session session = factory.getCurrentSession();
	    String hql = "FROM DaoDien";
	    Query query = session.createQuery(hql);
	    @SuppressWarnings("unchecked")
	    List<DaoDien> list = query.list();
	    return list;
   }
   
	@Transactional
	@RequestMapping("film/detail/{maPhim}.htm")
	public String payment(Model model, @PathVariable("maPhim") Integer maPhim) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Phim WHERE maPhim= :maPhim";
        Query query = session.createQuery(hql);
        query.setParameter("maPhim", maPhim);
        Phim phim = (Phim) query.uniqueResult();
        DanhGiaPhim existingRating = (DanhGiaPhim) session.createQuery("FROM DanhGiaPhim WHERE phim.maPhim = :maPhim AND khachhang.maKH = :maKH")
        	    .setParameter("maPhim", maPhim)
        	    .setParameter("maKH", LoginController.kh.getMaKH())
        	    .uniqueResult();
    	int ratingScore = (existingRating != null) ? existingRating.getDiem() : 0;
    	model.addAttribute("ratingScore", ratingScore);
    	System.out.println(ratingScore);
        model.addAttribute("phim", phim);
        return "detail";
	}
}
package admin.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import admin.controller.Message;
import javassist.expr.NewArray;
import poly.entity.ChiTietTheLoai;
import poly.entity.DaoDien;
import poly.entity.DienVien;
import poly.entity.LichChieu;
import poly.entity.Phim;
import poly.entity.TheLoai;
import poly.entity.VaiDien;

@Transactional
@Controller
@RequestMapping("/admin/")
public class MovieController {
	@Autowired
	SessionFactory factory;
	
    @Autowired
    ServletContext context;
    
	public List<Phim> getPhims() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Phim";
		Query query = session.createQuery(hql);
		List<Phim> list = query.list();
		return list;
	}

	public Phim getSinglePhims(Integer maPhim) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Phim where maPhim=:maPhim";
		Query query = session.createQuery(hql);
		query.setParameter("maPhim", maPhim);
		Phim n = (Phim) query.list().get(0);

		return n;
	}

	public Integer getLichChieusByIdPhim(Integer id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM LichChieu";
		Query query = session.createQuery(hql);
		List<LichChieu> list = query.list();

		for (LichChieu l : list) {
			if (l.getDsPhim().getMaPhim() == id) {
				return 1;
			}
		}

		return 0;
	}

	public List<ChiTietTheLoai> getTheLoaiByIdPhim(Integer id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ChiTietTheLoai";
		Query query = session.createQuery(hql);
		List<ChiTietTheLoai> list = query.list();
		List<ChiTietTheLoai> newlist = new ArrayList<ChiTietTheLoai>();

		for (ChiTietTheLoai l : list) {
			if (l.getPhim().getMaPhim() == id) {
				newlist.add(l);
			}
		}
		return newlist;
	}

	public TheLoai getCTTL(Integer maTL) {
	    Session session = factory.getCurrentSession();
	    String hql = "FROM TheLoai where maTL=:maTL";
	    Query query = session.createQuery(hql);
	    query.setParameter("maTL", maTL);
	    return (TheLoai) query.uniqueResult();
	}

	public List<TheLoai> getAllCTTL() {
		Session session = factory.getCurrentSession();
		String hql = "FROM TheLoai";
		Query query = session.createQuery(hql);
		return query.list();
	}
	
	public DaoDien getDaoDienByTen(String tenDaoDien, Session session) {
	    Query query = session.createQuery("FROM DaoDien WHERE TenDaoDien = :tenDaoDien");
	    query.setParameter("tenDaoDien", tenDaoDien);
	    return (DaoDien) query.uniqueResult();
	}
	
	public DienVien getDienVienById(Integer id, Session session) {
	    Query query = session.createQuery("FROM DienVien WHERE idDienVien = :id");
	    query.setParameter("id", id);
	    return (DienVien) query.uniqueResult();
	}
	
	public VaiDien getVaiDien(Integer idDienVien, Integer maPhim, Session session) {
	    String hql = "FROM VaiDien vd WHERE vd.dienvien.idDienVien = :idDienVien AND vd.phim.maPhim = :maPhim";
	    Query query = session.createQuery(hql);
	    query.setParameter("idDienVien", idDienVien);
	    query.setParameter("maPhim", maPhim);

	    return (VaiDien) query.uniqueResult();
	}


	@RequestMapping(value = "movie/add.htm", method = RequestMethod.POST)
	public String insert(ModelMap model, @ModelAttribute("movie") Phim movie, BindingResult result,
	        @RequestParam("thoiLuong") String thoiLuongString,
	        @RequestParam("ngayKhoiChieu") String ngayKhoiChieu,
	        @RequestParam("tenDaoDien") String tenDaoDien,
	        @RequestParam("maTT") Integer maTT,
	        @RequestParam("TL") Integer[] TL,
	        @RequestParam("moviePhoto") MultipartFile moviePhoto,
	        @RequestParam("dienVien-1") Integer dienVien1,
	        @RequestParam("dienVien-2") Integer dienVien2,
	        @RequestParam("dienVien-3") Integer dienVien3,
	        @RequestParam("vaiDien-1") String vaiDien1,
	        @RequestParam("vaiDien-2") String vaiDien2,
	        @RequestParam("vaiDien-3") String vaiDien3,
	        HttpServletRequest request,
	        RedirectAttributes redirectAttributes) {
	    try {
	        // Chuyển đổi ngày khởi chiếu từ string thành Date
	        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
	        Date ngayKhoiChieuDate = formatter.parse(ngayKhoiChieu);
	        int thoiLuongI = Integer.parseInt(thoiLuongString);

	        // Mở session và bắt đầu transaction
	        Session session = factory.openSession();
	        Transaction t = session.beginTransaction();
	        try {
	            // Xử lý đạo diễn
	            DaoDien daoDien = getDaoDienByTen(tenDaoDien, session);
	            if (daoDien == null) {
	                daoDien = new DaoDien();
	                daoDien.setTenDaoDien(tenDaoDien);
	                session.save(daoDien);
	            }

	            // Cập nhật thông tin phim
	            movie.setDaoDien(daoDien);
	            movie.setThoiLuong(thoiLuongI);
	            movie.setNgayKhoiChieu(ngayKhoiChieuDate);
	            movie.setMaTT(maTT);

	            // Xử lý ảnh bìa phim
	            String photoPath = null;
	            if (moviePhoto.isEmpty()) {
	                model.addAttribute("message", "Vui lòng chọn file !");
	            } else {
	                try {
	                    photoPath = context.getRealPath("/uploads/" + moviePhoto.getOriginalFilename());
	                    moviePhoto.transferTo(new File(photoPath));
	                    redirectAttributes.addFlashAttribute("photo_name", moviePhoto.getOriginalFilename());
	                    movie.setLinkAnh(moviePhoto.getOriginalFilename());
	                } catch (Exception e) {
	                    model.addAttribute("message", "Lỗi lưu file");
	                    return "admin/movie";
	                }
	            }

	            // Lưu thông tin phim
	            session.save(movie);
	            t.commit();

	            // Lưu danh mục thể loại
	            Transaction ts = session.beginTransaction();
	            try {
	                for (Integer tlId : TL) {
	                    TheLoai cttl = getCTTL(tlId);
	                    ChiTietTheLoai theLoai = new ChiTietTheLoai(cttl, movie);
	                    session.save(theLoai);
	                }

	                // Lưu diễn viên và vai diễn
	                saveDienVienVaiDien(dienVien1, vaiDien1, movie, session);
	                saveDienVienVaiDien(dienVien2, vaiDien2, movie, session);
	                saveDienVienVaiDien(dienVien3, vaiDien3, movie, session);

	                redirectAttributes.addFlashAttribute("message", new Message("success", "Thêm thành công"));
	                ts.commit();
	                return "redirect:/admin/movie.htm";
	            } catch (Exception e) {
	                ts.rollback();
	                System.out.println("Error while adding categories and actors: " + e.getMessage());
	            }
	        } catch (Exception e) {
	            t.rollback();
	            System.out.println("Error while saving movie: " + e.getMessage());
	        } finally {
	            session.close();
	        }
	    } catch (Exception e) {
	        System.out.println("Error parsing date or time duration: " + e.getMessage());
	    }
	    redirectAttributes.addFlashAttribute("message", new Message("error", "Thêm thất bại"));
	    return "redirect:/admin/movie.htm";
	}

	private void saveDienVienVaiDien(Integer dienVienId, String vaiDien, Phim movie, Session session) {
	    if (dienVienId != null && vaiDien != null && !vaiDien.trim().isEmpty()) {
	        DienVien dienVien = (DienVien)session.get(DienVien.class, dienVienId);
	        if (dienVien != null) {
	            VaiDien vaiDienEntity = new VaiDien();
	            vaiDienEntity.setDienVien(dienVien);
	            vaiDienEntity.setPhim(movie);
	            vaiDienEntity.setTenVaiDien(vaiDien);
	            session.save(vaiDienEntity);
	        }
	    }
	}

	public boolean deleteTLP(Integer maTL, Integer maPhim) {
	    Session session = factory.openSession();
	    Transaction t = session.beginTransaction();
	    try {
	        String hql = "delete from ChiTietTheLoai where maTL = :maTL and maPhim = :maPhim";
	        Query query = session.createQuery(hql);
	        query.setParameter("maTL", maTL);
	        query.setParameter("maPhim", maPhim);
	        query.executeUpdate();
	        t.commit();
	    } catch (Exception e) {
	        t.rollback();
	    } finally {
	        session.close();
	    }
	    return true;
	}

	public ChiTietTheLoai getTLP(Integer maTL, Integer maPhim) {
	    Session session = factory.getCurrentSession();
	    String hql = "from ChiTietTheLoai where maTL = :maTL and maPhim = :maPhim";
	    Query query = session.createQuery(hql);
	    query.setParameter("maTL", maTL);
	    query.setParameter("maPhim", maPhim);
	    return (ChiTietTheLoai) query.uniqueResult();
	}
	
	public VaiDien getVaiDien(Integer dienVien, Integer phim) {
	    Session session = factory.openSession();
	    try {
	        String hql = "FROM VaiDien v WHERE v.dienvien.idDienVien = :idDienVien AND v.phim.maPhim = :maPhim";
	        Query query = session.createQuery(hql);
	        query.setParameter("idDienVien", dienVien);
	        query.setParameter("maPhim", phim);
	        return (VaiDien) query.uniqueResult();
	    } finally {
	        session.close();
	    }
	}

	@RequestMapping(value = "movie/update/{id}.htm", method = RequestMethod.POST)
	public String updateMovie(
	        ModelMap model, 
	        @ModelAttribute("movieUpdate") Phim movie, 
	        BindingResult result, 
	        @RequestParam("thoiLuong") String thoiLuongString,
	        @RequestParam("ngayKhoiChieu") String ngayKhoiChieu,
	        @RequestParam("maPhimN") Integer maPhimN,
	        @RequestParam("maTT") Integer maTT,
	        @RequestParam("tenPhim") String tenPhim,
	        @RequestParam("moTa") String moTa,
	        @RequestParam("nuocSX") String nuocSX,
	        @RequestParam("namSX") Integer namSX,
	        @RequestParam("daoDien") String daoDien,
	        @RequestParam("linkTrailer") String linkTrailer,
	        @RequestParam("moviePhoto1") MultipartFile moviePhoto,
	        @RequestParam Map<String, String> vaiDienMap,
	        HttpServletRequest request,
	        RedirectAttributes redirectAttributes
	) {
	    String[] TL = request.getParameterValues("TL");
	    if (TL == null || TL.length == 0) {
	        redirectAttributes.addFlashAttribute("message", new Message("error", "Vui lòng chọn ít nhất một thể loại phim"));
	        return "redirect:/admin/movie.htm";
	    }

	    Session session = factory.openSession();
	    Transaction t = null;

	    try {
	        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
	        Date ngayKhoiChieuDate = formatter.parse(ngayKhoiChieu);
	        int thoiLuongI = Integer.parseInt(thoiLuongString);

	        t = session.beginTransaction();

	        DaoDien daoDienEntity = getDaoDienByTen(daoDien, session);
	        if (daoDienEntity == null) {
	            daoDienEntity = new DaoDien();
	            daoDienEntity.setTenDaoDien(daoDien);
	            session.save(daoDienEntity);
	            session.flush();
	        }

	        movie = getSinglePhims(maPhimN);
	        movie.setThoiLuong(thoiLuongI);
	        movie.setMaTT(maTT);
	        movie.setNgayKhoiChieu(ngayKhoiChieuDate);
	        movie.setMoTa(moTa);
	        movie.setNamSX(namSX);
	        movie.setTenPhim(tenPhim);
	        movie.setNuocSX(nuocSX);
	        movie.setDaoDien(daoDienEntity);
	        movie.setLinkTrailer(linkTrailer);

	        String photoPath = null;
	        if (moviePhoto.isEmpty()) {
	            model.addAttribute("message", "Vui lòng chọn file !");
	        } else {
	            try {
	                photoPath = context.getRealPath("/uploads/" + moviePhoto.getOriginalFilename());
	                moviePhoto.transferTo(new File(photoPath));
	                System.out.println("Đường dẫn: " + photoPath);
	                redirectAttributes.addFlashAttribute("photo_name", moviePhoto.getOriginalFilename());
	                movie.setLinkAnh(moviePhoto.getOriginalFilename());
	            } catch (Exception e) {
	                model.addAttribute("message", "Lỗi lưu file");
	                return "admin/movie";
	            }
	        }

	        session.merge(movie);

	        // Cập nhật các thể loại cho phim
	        List<ChiTietTheLoai> listOld = new ArrayList<>(movie.getChiTietTheLoais());
	        List<ChiTietTheLoai> listDelete = new ArrayList<>(listOld);
	        List<ChiTietTheLoai> listNew = new ArrayList<>();

	        for (String tlId : TL) {
	            Integer maTL = Integer.parseInt(tlId);
	            TheLoai cttl = getCTTL(maTL);
	            ChiTietTheLoai theLoai = getTLP(maTL, movie.getMaPhim());
	            if (theLoai != null) {
	                listNew.add(theLoai);
	            }
	        }

	        listDelete.removeAll(listNew);
	        for (ChiTietTheLoai theLoai : listDelete) {
	            deleteTLP(theLoai.getTheLoai().getMaTL(), movie.getMaPhim());
	        }

	        session.flush();

	        // Thêm các thể loại mới vào phim
	        for (String tlId : TL) {
	            Integer maTL = Integer.parseInt(tlId);
	            TheLoai cttl = getCTTL(maTL);
	            ChiTietTheLoai theLoai = new ChiTietTheLoai(cttl, movie);
	            session.merge(theLoai);
	        }

	        for (String key : request.getParameterMap().keySet()) {
	            if (key.startsWith("vaiDien-")) {
	                String idDienVienStr = key.split("-")[1];
	                Integer idDienVien = Integer.parseInt(idDienVienStr);
	                
	                String newIdDienVienValue = request.getParameter("dienVien-" + idDienVienStr);
	                if (newIdDienVienValue != null && !newIdDienVienValue.isEmpty()) {
	                    Integer newIdDienVien = Integer.parseInt(newIdDienVienValue);
	                    String vaiDienValue = request.getParameter(key);

	                    System.out.println("Diễn viên cũ: " + idDienVien);
	                    System.out.println("Diễn viên mới: " + newIdDienVien);
	                    System.out.println("Vai diễn: " + vaiDienValue);

	                    VaiDien vaiDien = getVaiDien(idDienVien, movie.getMaPhim(), session);
	                    if (vaiDien != null) {
	                        if (!idDienVien.equals(newIdDienVien)) {
	                            String hql = "UPDATE VaiDien vd SET vd.dienvien.idDienVien = :newIdDienVien "
	                                       + "WHERE vd.dienvien.idDienVien = :oldIdDienVien AND vd.phim.maPhim = :maPhim";
	                            
	                            Query query = session.createQuery(hql);
	                            query.setParameter("newIdDienVien", newIdDienVien);
	                            query.setParameter("oldIdDienVien", idDienVien);
	                            query.setParameter("maPhim", movie.getMaPhim());
	                            
	                            int updateResult = query.executeUpdate();
	                            
	                            if (updateResult > 0) {
	                                System.out.println("Cập nhật thành công VaiDien với idDienVien mới: " + newIdDienVien);
	                            }
	                        }
	                        
	                        vaiDien.setTenVaiDien(vaiDienValue);
	                        session.merge(vaiDien);
	                    } else {
	                        DienVien newDienVien = getDienVienById(newIdDienVien, session);
	                        if (newDienVien != null) {
	                            vaiDien = new VaiDien();
	                            vaiDien.setDienVien(newDienVien);
	                            vaiDien.setPhim(movie);
	                            vaiDien.setTenVaiDien(vaiDienValue);
	                            session.save(vaiDien);
	                        }
	                    }

	                } else {
	                    System.out.println("Diễn viên mới không hợp lệ: " + newIdDienVienValue);
	                }

	            }
	        }




	        t.commit();
	        redirectAttributes.addFlashAttribute("message", new Message("success", "Chỉnh sửa thành công"));
	        return "redirect:/admin/movie.htm";

	    } catch (Exception e) {
	        if (t != null) t.rollback();
	        redirectAttributes.addFlashAttribute("message", new Message("error", "Chỉnh sửa thất bại"));
	        e.printStackTrace();
	    } finally {
	        session.close();
	    }

	    List<Phim> list = getPhims();
	    model.addAttribute("phim", list);
	    return "redirect:/admin/movie.htm";
	}


	@RequestMapping(value = "movie/delete/{id}.htm", method = RequestMethod.POST)
	public String delete_User(ModelMap model, @PathVariable("id") Integer id, RedirectAttributes redirectAttributes) {
		try {
			Phim lc = getSinglePhims(id);
			Integer temp = this.deleteNews(id);
			if (temp == 1) {
				redirectAttributes.addFlashAttribute("message", new Message("success", "Xóa thành công"));
				System.out.println("Xóa thành công!");
			} else if (temp == 0) {
				redirectAttributes.addFlashAttribute("message", new Message("error", "Xóa thất bại"));
				System.out.println("Xóa thất bại!");
			}

			return "redirect:/admin/movie.htm";
		} catch (Exception e) {
			System.out.println(e);

		}

		List<Phim> list = getPhims();
		model.addAttribute("phim", list);
		redirectAttributes.addFlashAttribute("message", new Message("error", "Xóa thất bại"));
		return "redirect:/admin/movie.htm";
	}

	public Integer deleteNews(Integer id) {
		Phim lc = new Phim();
		List<ChiTietTheLoai> list = getTheLoaiByIdPhim(id);
		lc.setMaPhim(id);
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			Integer temp = getLichChieusByIdPhim(id);
			if (temp == 1) {
				return 0;
			}
			for (ChiTietTheLoai v : list) {
				session.delete(v);
			}
			session.delete(lc);
			t.commit();
			System.out.println("sau commit");
			return 1;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println(e);
			t.rollback();
			return 0;
		} finally {
			session.close();
		}

	}
}

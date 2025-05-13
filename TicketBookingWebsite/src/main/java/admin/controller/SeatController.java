package admin.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import admin.controller.Message;
import poly.entity.ChiTietGhePhong;
import poly.entity.ChiTietTheLoai;
import poly.entity.LoaiGhe;
import poly.entity.PhongChieu;
import poly.entity.TheLoai;
import poly.entity.Ve;

@Transactional
@Controller
@RequestMapping("/admin/")
public class SeatController {
	@Autowired
	SessionFactory factory;
	
	
	public List<LoaiGhe> getSeats(){
		Session session = factory.getCurrentSession();
		String hql = "FROM LoaiGhe";
		Query query = session.createQuery(hql);
		List<LoaiGhe> list = query.list();
		return list;
	}
	
	public LoaiGhe getSingleSeats(Integer IdLoaiGhe) {
		Session session = factory.getCurrentSession();
		String hql = "FROM LoaiGhe where IdLoaiGhe=:IdLoaiGhe";
		Query query = session.createQuery(hql);
		query.setParameter("IdLoaiGhe", IdLoaiGhe);
		LoaiGhe n = (LoaiGhe) query.list().get(0);

		return n;
	}
	
	public boolean ktLG(Integer IdLoaiGhe) {
		Session session = factory.getCurrentSession();
		String hql = "FROM LoaiGhe";
		Query query = session.createQuery(hql);
		List<LoaiGhe> list = query.list();
		for(LoaiGhe i : list) {
			if(i.getIdLoaiGhe().equals(IdLoaiGhe)) {
				return true;
			}
		}
		return false;
	}
	
	@RequestMapping(value = "seat/add.htm", method = RequestMethod.POST)
	public String insert(ModelMap model, @ModelAttribute("seat") LoaiGhe seat, BindingResult result, BindingResult errors,@RequestParam("gia") String giaString, RedirectAttributes redirectAttributes) {

			Double giaI = Double.parseDouble(giaString);
			if(ktLG(seat.getIdLoaiGhe())) {

				System.out.println("trung ma loai ve ");
				redirectAttributes.addFlashAttribute("message",
						new Message("error","Trùng mã loại ghế"));
				return "redirect:/admin/seat.htm";
			}
			try {
				Session session = factory.openSession();
				Transaction t = session.beginTransaction();
				try {
					seat.setGia(giaI);
					session.save(seat);
					redirectAttributes.addFlashAttribute("message",
							new Message("success","Thêm thành công"));
					t.commit();

					return "redirect:/admin/seat.htm";
					
				} catch (Exception e) {
					t.rollback();
					System.out.println("error catch " +e.getCause());
				} finally {
					session.close();
				}

			} catch (Exception e) {
				// TODO: handle exception
			}

		List<LoaiGhe> lg = getSeats();
		model.addAttribute("lg", lg);
		
		
		redirectAttributes.addFlashAttribute("message",
				new Message("error","Thêm thất bại"));
		

		return "redirect:/admin/seat.htm";
	}
	@RequestMapping(value = "seat/update/{idLoaiGhe}.htm",  method=RequestMethod.POST)
	public String updateRoom(ModelMap model,@ModelAttribute("seatUpdate") LoaiGhe seat,
			@PathVariable("idLoaiGhe") Integer id,RedirectAttributes redirectAttributes,
			@RequestParam("gia") String giaString,@RequestParam("tenLoai") String tenLG) {

		//		System.out.print(seat.getIdLoaiGhe());
		Double giaI = Double.parseDouble(giaString);
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			Integer maGhe = seat.getIdLoaiGhe();
//			System.out.print("123456 "+maVe);
			seat = getSingleSeats(maGhe);
//			System.out.print(seat.getGia());
			seat.setIdLoaiGhe(id);
			seat.setGia(giaI);
			seat.setTenLoai(tenLG);
			session.merge(seat);
			redirectAttributes.addFlashAttribute("message",
					new Message("success","sửa thành công"));
			t.commit();
			
			return "redirect:/admin/seat.htm";
		}
		catch(Exception e) {
			System.out.println("error catch " +e.getCause());
			t.rollback();
		}
		finally {
			session.close();
		}

		redirectAttributes.addFlashAttribute("message",
				new Message("error","sửa thất bại"));
		

		return "redirect:/admin/seat.htm";
		}
	
	public Integer getPhimByIdLG(Integer id){
	    Session session = factory.getCurrentSession();
	    String hql = "FROM ChiTietGhePhong";
	    Query query = session.createQuery(hql);
	    List<ChiTietGhePhong> list = query.list();
	    for (ChiTietGhePhong chiTiet : list) {
	        if (chiTiet.getLoaiGhe().getIdLoaiGhe().equals(id)) {
	            return 1;
	        }
	    }
	    return 0;
	}

	@RequestMapping(value = "seat/delete/{id}.htm", method = RequestMethod.POST)
	public String delete_User(ModelMap model, @PathVariable("id") String id, RedirectAttributes redirectAttributes) {
	    try {
	        Integer temp = this.deleteNews(id);
	        if (temp == 1) {
	            redirectAttributes.addFlashAttribute("message", new Message("success", "xóa thành công"));
	            System.out.println("Xóa thành công!");
	        } else if (temp == 0) {
	            redirectAttributes.addFlashAttribute("message", new Message("error", "xóa thất bại"));
	            System.out.println("Xóa thất bại!");
	        }

	        return "redirect:/admin/seat.htm";
	    } catch (Exception e) {
	        System.out.println(e);
	        return "redirect:/admin/seat.htm"; // Đảm bảo có giá trị trả về hợp lệ trong trường hợp lỗi
	    }
	}


	public Integer deleteNews(String id) {
	    LoaiGhe lg = new LoaiGhe();
	    
	    // Chuyển đổi id từ String sang Integer
	    Integer idLoaiGhe = Integer.valueOf(id);  // Hoặc sử dụng `parseInt` nếu cần
	    
	    lg.setIdLoaiGhe(idLoaiGhe);  // Sử dụng Integer thay vì String

	    Session session = factory.openSession();
	    Transaction t = session.beginTransaction();
	    try {
	        if(getPhimByIdLG(idLoaiGhe) == 1) {  // Chuyển id thành Integer khi gọi getPhimByIdLG
	            return 0;
	        }
	        session.delete(lg);
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


package admin.controller;

import java.util.List;

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

import poly.entity.ChiTietTheLoai;
import poly.entity.LichChieu;
import poly.entity.TheLoai;
import poly.entity.Ve;

@Transactional
@Controller
@RequestMapping("/admin/")
public class TypeController {
	@Autowired
	SessionFactory factory;
	
	
	public List<TheLoai> getTypes(){
		Session session = factory.getCurrentSession();
		String hql = "FROM TheLoai";
		Query query = session.createQuery(hql);
		List<TheLoai> list = query.list();
		return list;
	}
	public boolean ktTL(int maTL) {
	    Session session = factory.getCurrentSession();
	    String hql = "FROM TheLoai";
	    Query query = session.createQuery(hql);
	    List<TheLoai> list = query.list();
	    for (TheLoai i : list) {
	        if (i.getMaTL() == maTL) {
	            return true;
	        }
	    }
	    return false;
	}

	public TheLoai getSingleType(String MaTL) {
		Session session = factory.getCurrentSession();
		String hql = "FROM TheLoai where MaTL=:MaTL";
		Query query = session.createQuery(hql);
		query.setParameter("MaTL", MaTL);
		TheLoai n = (TheLoai) query.list().get(0);

		return n;
	}
	
	public Integer getPhimByIdTL(String id){
	    Session session = factory.getCurrentSession();
	    String hql = "FROM ChiTietTheLoai";
	    Query query = session.createQuery(hql);
	    List<ChiTietTheLoai> list = query.list();

	    for (ChiTietTheLoai l : list) {
	        if (String.valueOf(l.getTheLoai().getMaTL()).equals(id)) {
	            return 1;
	        }
	    }
	    return 0;
	}

	@RequestMapping(value = "type/add.htm", method = RequestMethod.POST)
	public String insert(ModelMap model, @ModelAttribute("type") TheLoai type, BindingResult result, BindingResult errors,RedirectAttributes redirectAttributes) {

			
			if(ktTL(type.getMaTL())) {

				
				redirectAttributes.addFlashAttribute("message",
						new Message("error","Trùng mã thể loại"));
				System.out.println("trung` ma the loai ");
				return "redirect:/admin/type.htm";
			}
			try {
				Session session = factory.openSession();
				Transaction t = session.beginTransaction();
				try {
					
					session.save(type);
					redirectAttributes.addFlashAttribute("message",
							new Message("success","Thêm thành công"));
					t.commit();

					return "redirect:/admin/type.htm";
					
				} catch (Exception e) {
					t.rollback();
					System.out.println("error catch " +e.getCause());
				} finally {
					session.close();
				}

			} catch (Exception e) {
				/* TODO: handle exception */
			}

		List<TheLoai> types = getTypes();
		model.addAttribute("type", types);
		
		
		redirectAttributes.addFlashAttribute("message",
				new Message("error","Thêm thất bại"));
		

		return "redirect:/admin/type.htm";
	}
	@RequestMapping(value = "type/update/{id}.htm",  method=RequestMethod.POST)
	public String updateRoom(ModelMap model, @ModelAttribute("type") TheLoai type, BindingResult result, BindingResult errors,@RequestParam("tenTL") String tenTL,@RequestParam("maTL") String maTL, RedirectAttributes redirectAttributes) {

				//System.out.print(ticket.getMaLV());
		
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			String newmaTL = String.valueOf(type.getMaTL());
			/* System.out.print("123456 "+maVe); */
			type = getSingleType(newmaTL);
			/* System.out.print(ticket.getGia()); */
			//type.setMaTL(maTL);
			type.setMaTL(Integer.parseInt(maTL));

			type.setTenTL(tenTL);
			session.merge(type);
			redirectAttributes.addFlashAttribute("message",
					new Message("success","sửa thành công"));
			t.commit();
			
			return "redirect:/admin/type.htm";
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
		

		return "redirect:/admin/type.htm";
		}
	
	@RequestMapping(value = "type/delete/{id}.htm", method = RequestMethod.POST)
	public String delete_User(ModelMap model, @PathVariable("id") String id, RedirectAttributes redirectAttributes) {
		try {

			
			Integer temp = this.deleteNews(id);
			if (temp == 1) {
				/*
				 * model.addAttribute("message","Xóa thành công!");
				 * redirectAttributes.addFlashAttribute("message", new
				 * Message("success","Xoá thành công"));
				 */
				redirectAttributes.addFlashAttribute("message", new Message("success", "xóa thành công"));
				System.out.println("Xóa thành công!");
			} else if (temp == 0) {
				/*
				 * model.addAttribute("message","Xóa thất bại!"); 
				 * model.addAttribute("message",
				 * new Message("error","Xóa thất bại!"));
				 */
				redirectAttributes.addFlashAttribute("message", new Message("error", "xóa thất bại"));
				System.out.println("Xóa thất bại!");
			}

			return "redirect:/admin/type.htm";
		} catch (Exception e) {
			System.out.println(e);

		}

		
		
		redirectAttributes.addFlashAttribute("message", new Message("error", "xóa thất bại"));
		return "redirect:/admin/showtimes.htm";
	}

	public Integer deleteNews(String id) {
		TheLoai lc = new TheLoai();
		//lc.setMaTL(id);
		lc.setMaTL(Integer.parseInt(id));

		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			if(getPhimByIdTL(id)==1) {
				return 0;
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

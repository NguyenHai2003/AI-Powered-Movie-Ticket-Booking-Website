//package admin.controller;
//
//import java.text.SimpleDateFormat;
//import java.util.Date;
//import java.util.List;
//import java.util.Locale;
//
//import javax.transaction.Transactional;
//
//import org.hibernate.Query;
//import org.hibernate.Session;
//import org.hibernate.SessionFactory;
//import org.hibernate.Transaction;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.ModelMap;
//import org.springframework.validation.BindingResult;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
//
//import admin.controller.Message;
//import poly.entity.LoaiVe;
//import poly.entity.PhongChieu;
//import poly.entity.Ve;
//
//@Transactional
//@Controller
//@RequestMapping("/admin/")
//public class TicketController {
//	@Autowired
//	SessionFactory factory;
//	
//	
//	public List<LoaiVe> getTickets(){
//		Session session = factory.getCurrentSession();
//		String hql = "FROM LoaiVe";
//		Query query = session.createQuery(hql);
//		List<LoaiVe> list = query.list();
//		return list;
//	}
//	
//	public LoaiVe getSingleTickets(String MaLV) {
//		Session session = factory.getCurrentSession();
//		String hql = "FROM LoaiVe where MaLV=:MaLV";
//		Query query = session.createQuery(hql);
//		query.setParameter("MaLV", MaLV);
//		LoaiVe n = (LoaiVe) query.list().get(0);
//
//		return n;
//	}
//	
//	public boolean ktLV(String maLV) {
//		Session session = factory.getCurrentSession();
//		String hql = "FROM LoaiVe";
//		Query query = session.createQuery(hql);
//		List<LoaiVe> list = query.list();
//		for(LoaiVe i : list) {
//			if(i.getMaLV().equals(maLV)) {
//				return true;
//			}
//		}
//		return false;
//	}
//	
//	@RequestMapping(value = "ticket/add.htm", method = RequestMethod.POST)
//	public String insert(ModelMap model, @ModelAttribute("ticket") LoaiVe ticket, BindingResult result, BindingResult errors,@RequestParam("gia") String giaString, RedirectAttributes redirectAttributes) {
//
//			int giaI = Integer.parseInt(giaString);
//			if(ktLV(ticket.getMaLV())) {
//
//				System.out.println("trung` ma loai ve ");
//				redirectAttributes.addFlashAttribute("message",
//						new Message("error","Trùng mã loại vé"));
//				return "redirect:/admin/ticket.htm";
//			}
//			try {
//				Session session = factory.openSession();
//				Transaction t = session.beginTransaction();
//				try {
//					ticket.setGia(giaI);
//					session.save(ticket);
//					redirectAttributes.addFlashAttribute("message",
//							new Message("success","Thêm thành công"));
//					t.commit();
//
//					return "redirect:/admin/ticket.htm";
//					
//				} catch (Exception e) {
//					t.rollback();
//					System.out.println("error catch " +e.getCause());
//				} finally {
//					session.close();
//				}
//
//			} catch (Exception e) {
//				// TODO: handle exception
//			}
//
//		List<LoaiVe> lv = getTickets();
//		model.addAttribute("lv", lv);
//		
//		
//		redirectAttributes.addFlashAttribute("message",
//				new Message("error","Thêm thất bại"));
//		
//
//		return "redirect:/admin/ticket.htm";
//	}
//	@RequestMapping(value = "ticket/update/{id}.htm",  method=RequestMethod.POST)
//	public String updateRoom(ModelMap model,@ModelAttribute("ticketUpdate") LoaiVe ticket,
//			@PathVariable("id") String id,RedirectAttributes redirectAttributes,
//			@RequestParam("gia") String giaString,@RequestParam("tenLV") String tenLV) {
//
//		//		System.out.print(ticket.getMaLV());
//		int giaI = Integer.parseInt(giaString);
//		Session session = factory.openSession();
//		Transaction t = session.beginTransaction();
//		
//		try {
//			String maVe = ticket.getMaLV();
////			System.out.print("123456 "+maVe);
//			ticket = getSingleTickets(maVe);
////			System.out.print(ticket.getGia());
//			ticket.setMaLV(id);
//			ticket.setGia(giaI);
//			ticket.setTenLV(tenLV);
//			session.merge(ticket);
//			redirectAttributes.addFlashAttribute("message",
//					new Message("success","sửa thành công"));
//			t.commit();
//			
//			return "redirect:/admin/ticket.htm";
//		}
//		catch(Exception e) {
//			System.out.println("error catch " +e.getCause());
//			t.rollback();
//		}
//		finally {
//			session.close();
//		}
//
//		redirectAttributes.addFlashAttribute("message",
//				new Message("error","sửa thất bại"));
//		
//
//		return "redirect:/admin/ticket.htm";
//		}
//	}
//

package admin.controller;

import java.text.DecimalFormat;
import java.util.List;
import java.util.Map;

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
import poly.entity.Ghe;
import poly.entity.LoaiGhe;
import poly.entity.PhongChieu;


@Transactional
@Controller
@RequestMapping("/admin/")
public class RoomController {
	@Autowired
	SessionFactory factory;

	public List<PhongChieu> getRooms() {
			Session session = factory.getCurrentSession();
			String hql = "FROM PhongChieu";
			Query query = session.createQuery(hql);
			List<PhongChieu> list = query.list();
			return list;
	}
	
	public PhongChieu getSingleRooms(String maPhong) {
	    Session session = factory.getCurrentSession();
	    String hql = "FROM PhongChieu WHERE maPhong = :maPhong";
	    Query query = session.createQuery(hql);
	    query.setParameter("maPhong", maPhong);
	    
	    List<PhongChieu> resultList = query.list();
	    
	    if (resultList.isEmpty()) {
	        return null;
	    }
	    return resultList.get(0);
	}

	public String generatorId(String refix, String table, String columnId) {
		Session session = factory.getCurrentSession();
		String hql = "FROM " + table;
		Query query = session.createQuery(hql);
		int number = query.list().size() + 1;
		boolean isInValid = true;
		String id = refix;
		DecimalFormat df = new DecimalFormat("00");
		while (isInValid) {
			String pkTemp = id + df.format(number);
			System.out.println(pkTemp);
			String hqlwhere = hql + " WHERE " + columnId + " = '" + pkTemp + "'";
			query = session.createQuery(hqlwhere);
			if (query.list().size() > 0)
				number++;
			else {
				id = pkTemp;
				isInValid = false;
			}
		}
		return id;
	}
	


    @RequestMapping(value = "room/add.htm", method = RequestMethod.POST)
    public String insert(ModelMap model, @ModelAttribute("room") PhongChieu room, BindingResult result,
                         RedirectAttributes redirectAttributes,
                         @RequestParam("totalRows") int totalRows,
                         @RequestParam("seatCountPerRow") String seatCountPerRow) {

        String[] seatCounts = seatCountPerRow.split(",");
        try {
            Session session = factory.openSession();
            Transaction t = session.beginTransaction();
            
            try {
                // Thêm phòng mới vào bảng PhongChieu
                room.setMaPhong(generatorId("P", "PhongChieu", "maPhong"));
                room.setTrangThai(false); // Phòng mới sẽ có trạng thái là chưa được kích hoạt
                session.save(room);

                // Lấy danh sách các loại ghế (Loại 1, 2, 3)
                String hql = "FROM LoaiGhe";
                Query query = session.createQuery(hql);
                List<LoaiGhe> loaiGheList = query.list();
                LoaiGhe loaiGhe1 = loaiGheList.stream().filter(lg -> lg.getIdLoaiGhe() == 1).findFirst().orElse(null);
                LoaiGhe loaiGhe2 = loaiGheList.stream().filter(lg -> lg.getIdLoaiGhe() == 2).findFirst().orElse(null);
                LoaiGhe loaiGhe3 = loaiGheList.stream().filter(lg -> lg.getIdLoaiGhe() == 3).findFirst().orElse(null);

                // Tạo ghế và thêm vào ChiTietGhePhong
                for (int row = 0; row < totalRows; row++) {
                    char rowLabel = (char) ('A' + row); // A, B, C, ..., Z
                    int seatCount = Integer.parseInt(seatCounts[row]);

                    for (int seatNum = 1; seatNum <= seatCount; seatNum++) {
                        // Tạo tên ghế cho từng ghế trong dãy, ví dụ: A01, A02, A11...
                        String seatName = rowLabel + String.format("%02d", seatNum);
                        System.out.println(seatName);

                        // HQL để tìm ghế theo tên
                        String hql1 = "FROM Ghe WHERE tenGhe = :tenGhe";
                        Query query1 = session.createQuery(hql1);
                        query1.setParameter("tenGhe", seatName);
                        Ghe existingSeat = (Ghe) query1.uniqueResult();

                        // Kiểm tra xem ghế đã tồn tại chưa
                        if (existingSeat == null) {
                            // Nếu ghế chưa tồn tại, tạo mới và lưu vào cơ sở dữ liệu
                            Ghe newSeat = new Ghe();
                            newSeat.setTenGhe(seatName);
                            session.save(newSeat); // Lưu ghế mới vào cơ sở dữ liệu
                            existingSeat = newSeat;
                        }

                     // Xác định loại ghế dựa trên yêu cầu mới
                        LoaiGhe seatType;
                        if (row < 3) {
                            // 3 hàng đầu là loaiGhe1
                            seatType = loaiGhe1;
                        } else if (row == totalRows - 1) {
                            // Hàng cuối tất cả ghế là loaiGhe3
                            seatType = loaiGhe3;
                        } else {
                            // Các hàng còn lại, 2 ghế đầu và 2 ghế cuối là loaiGhe1, các ghế còn lại là loaiGhe2
                            if (seatNum == 1 || seatNum == 2 || seatNum == seatCount - 1 || seatNum == seatCount) {
                                seatType = loaiGhe1;
                            } else {
                                seatType = loaiGhe2;
                            }
                        }

                        // Kiểm tra nếu ghế đã có trong ChiTietGhePhong cho phòng này
                        String hql2 = "FROM ChiTietGhePhong WHERE ghe = :ghe AND phong = :phong";
                        Query query2 = session.createQuery(hql2);
                        query2.setParameter("ghe", existingSeat);
                        query2.setParameter("phong", room);
                        List<ChiTietGhePhong> existingDetails = query2.list();

                        if (existingDetails.isEmpty()) {
                            // Nếu chưa có thông tin chi tiết ghế cho phòng này, thêm mới
                            ChiTietGhePhong chiTietGhePhong = new ChiTietGhePhong();
                            chiTietGhePhong.setGhe(existingSeat);
                            chiTietGhePhong.setPhong(room); // Gán phòng
                            chiTietGhePhong.setLoaiGhe(seatType); // Gán loại ghế
                            session.save(chiTietGhePhong);
                        }
                    }
                }

                // Commit giao dịch
                t.commit();
                redirectAttributes.addFlashAttribute("message", new Message("success", "Thêm phòng thành công"));

                return "redirect:/admin/room.htm";

            } catch (Exception e) {
                t.rollback();
                System.out.println("Error catch: " + e.getMessage());
                redirectAttributes.addFlashAttribute("message", new Message("error", "Thêm phòng thất bại"));
            } finally {
                session.close();
            }

        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("message", new Message("error", "Thêm phòng thất bại"));
        }

        // Trả về danh sách các phòng sau khi thêm phòng mới
        List<PhongChieu> pc = getRooms();
        model.addAttribute("pc", pc);
        return "redirect:/admin/room.htm";
    }




	@RequestMapping(value = "room/delete/{id}.htm")
	public String Delete(ModelMap model, @PathVariable("id") String id, RedirectAttributes redirectAttributes) {
	    try {
	        PhongChieu t = this.getSingleRooms(id);
	        if (t == null) {
	            redirectAttributes.addFlashAttribute("message", new Message("error", "Phòng không tồn tại."));
	            return "redirect:/admin/room.htm";
	        }
	        
	        Integer result = this.deleteRooms(t);  // Xóa phòng trong giao dịch đang có
	        if (result != 0) {
	            redirectAttributes.addFlashAttribute("message", new Message("success", "Xóa phòng thành công."));
	        } else {
	            redirectAttributes.addFlashAttribute("message", new Message("error", "Xóa phòng thất bại."));
	        }

	        return "redirect:/admin/room.htm";
	    } catch (Exception e) {
	        redirectAttributes.addFlashAttribute("message", new Message("error", "Lỗi khi xóa phòng: " + e.getMessage()));
	        e.printStackTrace(); // Log chi tiết lỗi
	        return "redirect:/admin/room.htm";
	    }
	}

	public Integer deleteRooms(PhongChieu rooms) {
	    try {
	        Session session = factory.getCurrentSession();
	        session.delete(rooms);
	        return 1;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return 0;
	    }
	}



	
//	@RequestMapping(value = "room/update/{id}.htm",  method=RequestMethod.POST)
//	public String updateRoom(ModelMap model,@ModelAttribute("room") PhongChieu room, @PathVariable("id") String id,RedirectAttributes redirectAttributes) {
//		Session session = factory.openSession();
//		Transaction t = session.beginTransaction();
//		try {
//			PhongChieu idnews = this.getSingleRooms(id);
//			if(idnews.getTrangThai()) {
//				idnews.setTrangThai(false);
//			} else {
//				idnews.setTrangThai(true);
//			}
//			session.merge(idnews);
//			t.commit();
//			redirectAttributes.addFlashAttribute("message",
//					new Message("success","sửa thành công"));
//			return "redirect:/admin/room.htm";
//		}
//		catch(Exception e) {
//			System.out.println(e);
//			t.rollback();
//		}
//		finally {
//			session.close();
//		}
//
//		redirectAttributes.addFlashAttribute("message",
//				new Message("error","sửa thất bại"));
//		return "redirect:/admin/room.htm";
//	}
}


# AI-Powered-Movie-Ticket-Booking-Website
## Website Đặt vé xem phim

Hệ thống Quản lý Đặt vé Xem phim là một website mạnh mẽ được xây dựng bằng Java, cung cấp giải pháp toàn diện cho việc quản lý các hoạt động của rạp chiếu phim. Ứng dụng này cho phép quản lý dễ dàng các bộ phim, phòng chiếu, lịch chiếu, khách hàng, và các giao dịch đặt vé. Điểm nổi bật của hệ thống là sự tích hợp của một chatbot AI thông minh, giúp người dùng đặt vé và nhận gợi ý phim một cách thuận tiện. Dữ liệu được lưu trữ an toàn trong SQL Server và ứng dụng được thiết kế theo kiến trúc MVC (Model-View-Controller) để đảm bảo tính linh hoạt và dễ bảo trì.

## Công nghệ sử dụng

* **Ngôn ngữ lập trình**: Java
* **Kiến trúc**: MVC (Model-View-Controller)
* **Cơ sở dữ liệu**: SQL Server
* **Cổng thanh toán**: API VNPay

## Tổng quan các tính năng
### A. Quản lý
1. **Quản lý Vé**
    - Chức năng thêm, sửa hoặc xóa thông tin vé.
    - Xem chi tiết các vé đã đặt.

2. **Quản lý Phòng Chiếu**
    - Chức năng thêm, sửa hoặc xóa thông tin phòng chiếu.
      ![image](https://github.com/user-attachments/assets/fe53e0ba-2bba-43aa-a06e-e44292684bbf)

3. **Quản lý Phim**
    - Chức năng thêm, sửa hoặc xóa thông tin phim.
      ![image](https://github.com/user-attachments/assets/fd07ed7f-8ab4-4141-9188-2e812b0154d0)

4. **Quản lý Khách hàng**
    - Chức năng thêm, sửa hoặc xóa thông tin khách hàng.

5.  **Quản lý Lịch chiếu**
    - Chức năng thêm lịch chiếu, sửa khi đủ điều kiện.
    ![image](https://github.com/user-attachments/assets/732f9d06-e02f-445a-9925-0a7fe4f42aa9)

6.  **Giao diện Admin**
   ![image](https://github.com/user-attachments/assets/9d7ca0c1-0c26-475f-a2f0-5640f760fa2e)

### B. Khách hàng
1. **Đăng nhập/đăng ký**
   - Đăng nhập
     ![Đăng nhập](https://github.com/user-attachments/assets/0d427ae1-7f64-41e1-88be-1b06dce10e28)
   - Đăng ký
     ![Đăng ký](https://github.com/user-attachments/assets/a8fd4ab5-ecc6-4492-a24d-dcc74dae204f)
      
2. **Các thông tin mặc định**
    - Cho phép khách hàng xem các thông tin mặc định như: trang chủ, phim đang chiếu, phim sắp chiếu,...
      ![image](https://github.com/user-attachments/assets/8949152a-5a7a-48c5-9d9c-10b4db3c1e56)
      ![image](https://github.com/user-attachments/assets/fb34361a-baf7-4492-8b8a-d11bb0086d1b)

3. **Chức năng Đặt Vé cho Khách hàng**
    - Khách hàng có thể chọn phim và suất chiếu.
      ![image](https://github.com/user-attachments/assets/864dd8ca-b6d8-45a2-8dff-09135d5d6ea5)
    - Lựa chọn đặt ghế.
      ![image](https://github.com/user-attachments/assets/48a32154-ea3e-45de-9be0-1493d5f3f5eb)
    - Thanh toán thành công sẽ được lưu trữ trong lịch sử giao dịch.
      ![image](https://github.com/user-attachments/assets/1d87ee43-db30-414d-8f36-b197c02f8e9d)
      ![image](https://github.com/user-attachments/assets/852903b2-0f90-454a-9267-1af7502076b8)
3. **Danh sách hóa đơn**
   ![image](https://github.com/user-attachments/assets/6929a622-71ae-4ab8-af78-407159847e58)
   
### C. Chatbot
* **Hỗ trợ người dùng đặt vé nhanh chóng thông qua đối thoại.**
* **Cung cấp gợi ý phim dựa trên sở thích hoặc lịch sử xem của người dùng.**
* **Trả lời các câu hỏi thường gặp về phim, lịch chiếu, và rạp chiếu.**

**Chức năng hiểu ngữ cảnh**
    ![image](https://github.com/user-attachments/assets/ba2278e7-0d00-4af8-a111-5fc3a35527f3)
    ![image](https://github.com/user-attachments/assets/31885dd1-40ea-40d2-bd15-972ad0b9f340)

**Đặt vé**
    ![image](https://github.com/user-attachments/assets/7f02cd03-77ff-4904-8d97-2bdbfefcbac0)

**Đề suất phim, chi nhánh, suất chiếu**
    ![image](https://github.com/user-attachments/assets/6d21338a-9f0c-4e6f-940d-3f59c5ab2b1f)
    ![image](https://github.com/user-attachments/assets/c131b7f8-b108-490a-a35c-b1c630d9308f)
    ![image](https://github.com/user-attachments/assets/8e3382a2-63f0-4fe2-8da1-d55f51c73694)


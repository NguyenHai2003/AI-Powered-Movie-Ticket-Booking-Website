package poly.bean;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // Kiểm tra xem người dùng đã đăng nhập chưa
        if (!isLoggedIn(request.getSession())) {
            // Nếu chưa đăng nhập, chuyển hướng người dùng đến trang đăng nhập
            response.sendRedirect(request.getContextPath() + "/login");
            return false;
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        // Phương thức này được gọi sau khi handler method đã được thực thi và trả về ModelAndView
        // Bạn có thể thực hiện các xử lý sau khi handler method đã hoàn thành ở đây
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        // Phương thức này được gọi sau khi response đã được gửi đi cho client
        // Bạn có thể thực hiện các xử lý sau khi response đã được gửi đi ở đây
    }

    private boolean isLoggedIn(HttpSession session) {
        // Thực hiện kiểm tra người dùng đã đăng nhập ở đây, ví dụ: kiểm tra xem có thông tin đăng nhập trong session không
        return session.getAttribute("user") != null;
    }
}

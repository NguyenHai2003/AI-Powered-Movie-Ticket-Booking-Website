package poly.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import poly.entity.KhachHang;
import poly.entity.NhanVien;

@Component
public class AuthorizeInterceptor implements HandlerInterceptor {
    
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        HttpSession session = request.getSession();
        Object user = session.getAttribute("user");
        
        if (user == null) {
            session.setAttribute("back-url", request.getRequestURI());
            response.sendRedirect(request.getContextPath() + "/login.htm");
            return false;
        }

        String role = "";
        if (user instanceof NhanVien) {
            role = "QuanLy";
        }

        String requiredRole = getRequiredRoleFromRequest(request);

        if (!role.equals(requiredRole)) {
            response.sendRedirect(request.getRequestURI());
            return false;
        }

        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler,
                                Exception ex) throws Exception {
    }

    private String getRequiredRoleFromRequest(HttpServletRequest request) {
        String uri = request.getRequestURI();
        if (uri.contains("/admin")) {
            return "QuanLy";
        }
        else return "ANY";
    }
}

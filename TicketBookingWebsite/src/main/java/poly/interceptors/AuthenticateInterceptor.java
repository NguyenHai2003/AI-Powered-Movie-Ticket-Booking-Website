package poly.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


public class AuthenticateInterceptor implements HandlerInterceptor{
	 @Override
	    public boolean preHandle(HttpServletRequest request,
	                             HttpServletResponse response, Object handler) throws Exception {
	        HttpSession session = request.getSession();
	        Object user = session.getAttribute("user");
	        if (user == null) {
	            String cpath = request.getContextPath();
	            String url = request.getRequestURI().replace(cpath, "");
	            session.setAttribute("BackUrl", url);
	            response.sendRedirect(cpath + "/login.htm");
	            return false;
	        }
	        return true;
	    }

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}
}

package school.binjiang.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import school.binjiang.po.User;

public class UserInterceptor implements HandlerInterceptor{

	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		
	}
	/**
	 * 在调用controller具体方法后拦截
	 */
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		
	}
	/**
	 * 在调用controller具体方法前拦截
	 */
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object object) throws Exception {
		 
	        //通过硬编码的方式来判断当前的请求路径是否要被直接放行的路径
	        HttpSession session = request.getSession();
	        User user = (User) session.getAttribute("user");
	        if(null == user)
	        {
	            request.getRequestDispatcher("/pages/message.jsp").forward(request, response);
	            return false;
	        }
	        return true;
	}
}

package cn.ssm.interceptor;


import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import cn.ssm.annotation.NeedLogin;



public class LoginInterceptor implements HandlerInterceptor{

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO 自动生成的方法存根

		NeedLogin needLogin = ((HandlerMethod)handler).getMethodAnnotation(NeedLogin.class);
		if(needLogin!=null){
			//判断session
			HttpSession session  = request.getSession();
			//从session中取出用户身份信息
			String no = (String) session.getAttribute("manager");
			System.out.println("--------------------------"+no);
			if(no != null){
				//身份存在，放行
				return true;
			}
			
			//执行这里表示用户身份需要认证，跳转登陆页面
			PrintWriter out = response.getWriter();  
	        out.println("<html>");      
	        out.println("<script>");      
	        out.println("window.open ('"+request.getContextPath()+"/login.html','_top')");      
	        out.println("</script>");      
	        out.println("</html>");
			return false;
		}
		return true;
	}


	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO 自动生成的方法存根
		
	}

	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO 自动生成的方法存根
		
	}

}

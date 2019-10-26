package au.usyd.elec5619.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //
        String uri = request.getRequestURI();
        if ((uri.indexOf("/user/login") >= 0)||(uri.indexOf("resources") >= 0)||(uri.indexOf("/user/register") >= 0)||(uri.indexOf("/hello.htm") >= 0)){
            return true;
        }
        //Get Session
        HttpSession session = request.getSession();
        Long id = (Long) session.getAttribute("user");
        if (id != null){
            return true;
        }
        request.getRequestDispatcher("/user/login").forward(request,response);
        return false;
    }
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
    }
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
    }
}
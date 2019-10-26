package au.usyd.elec5619.web;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import au.usyd.elec5619.domain.User;
import au.usyd.elec5619.service.UserManager;


@Controller
@RequestMapping(value="/user/**")
public class UserController{
	
	@Resource(name="userManager")
	private UserManager userManager;
	
	
	@RequestMapping(value="/login")
	public String userLogin() {
		return "login";
	}
	
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String userLogin(HttpServletRequest httpServletRequest,Model uiModel) {
		
		Map<String, Object> map = userManager.userLogin(httpServletRequest.getParameter("email"), httpServletRequest.getParameter("password"));
		User user = (User) map.get("user");
		String error = (String) map.get("error");
		
		if(user != null) {
			System.out.println("Login success");
			
			// Set session
			HttpSession session=httpServletRequest.getSession(true);
			session.setAttribute("user", user.getId());
			if (user.getId() == 77777777) {
				return "redirect:/admin";
			}
			return "redirect:/hello.htm";
		}
		else {
		uiModel.addAttribute("error",error);
		return "login";
		}
	}
	
	@RequestMapping(value="/register")
	public String userRegister(){
		return "register";
	}
	
	@RequestMapping(value="/register",method = RequestMethod.POST)
	public String userRegister(HttpServletRequest httpServletRequest,Model uiModel){
		
		String email = httpServletRequest.getParameter("email");
		String password = httpServletRequest.getParameter("password");
		String password_again = httpServletRequest.getParameter("password_again");
		String username = httpServletRequest.getParameter("username");
		String realname = httpServletRequest.getParameter("realname");
		String phone = httpServletRequest.getParameter("phone");
		
		Map<String, Object> map = userManager.userRegister(email, password, password_again, username, realname, phone);
		User user = (User) map.get("user");
		String error = (String) map.get("error");
		
		if (user !=null) {
			// Set session
			HttpSession session=httpServletRequest.getSession(true);
			session.setAttribute("user", user.getId());
			
			return "redirect:/hello.htm";
			}
		else {
			uiModel.addAttribute("error",error);
			return "register";
		}
		
	}
	
	@RequestMapping(value="/logout")
	public String userLogout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		return "redirect:/hello.htm";
	}
	
}	

package au.usyd.elec5619.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import au.usyd.elec5619.domain.User;
import au.usyd.elec5619.service.UserAdminManager;

@Controller
@RequestMapping(value="/adminuser/**")
public class AdminUserController {
	
	@Resource(name="userAdminManager")
	private UserAdminManager userAdminManager;
	
	@RequestMapping(value="/edit/{id}", method=RequestMethod.GET)
	public String editUser(@PathVariable("id") long id, Model uiModel) {
		User user = this.userAdminManager.getUserbyId(id);
		uiModel.addAttribute("user",user);
		
		return "AdminUserEditPage";
	}
	
	@RequestMapping(value="/edit/**", method=RequestMethod.POST)
	public String editUser(@Valid User user) {
		
		this.userAdminManager.updateUser(user);
		System.out.println(user.getId());
		
		return "redirect:/admin/usertable";
	}
	
	@RequestMapping(value="/delete/{id}", method=RequestMethod.GET)
	public String deleteUser(@PathVariable("id") long id) {
		
		this.userAdminManager.deleteUser(id);
		
		return "redirect:/admin/usertable";
	}
	
}

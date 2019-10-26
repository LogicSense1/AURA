package au.usyd.elec5619.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import au.usyd.elec5619.domain.Order;
import au.usyd.elec5619.domain.Product;
import au.usyd.elec5619.domain.User;
import au.usyd.elec5619.service.OrderManager;
import au.usyd.elec5619.service.ProductManager;
import au.usyd.elec5619.service.UserManager;

@Controller
@RequestMapping(value="/myaccount/**")
public class MyAccountController{
	
	@Resource(name="userManager")
	private UserManager userManager;
	
	@Resource(name="orderManager")
	private OrderManager orderManager;
	
	@Resource(name="productManager")
	private ProductManager productManager;
	
	
	@RequestMapping(value="/myprofile")
	public String myprofile(HttpServletRequest request,Model uiModel) {
		// Get Session
        HttpSession session = request.getSession();
        Long id = (Long) session.getAttribute("user");
        
        User user = this.userManager.getUserbyId(id);
        
        	
        uiModel.addAttribute("user",user);
        
		return "myprofile";
	}
	
	@RequestMapping(value="/myprofile", method=RequestMethod.POST)
	public String myprofile(User user,HttpServletRequest request,Model model) {
		
		String password_again=request.getParameter("password_again");
		String error = this.userManager.userProfileEdit(user,password_again);
		
		
		if (error == null) {
		return "redirect:myprofile";
		}
		model.addAttribute("error",error);
		return "myprofile";
	}
	
	@RequestMapping(value="/myphoto")
	public String myphoto(HttpServletRequest request,Model uiModel) {
		// Get Session
        HttpSession session = request.getSession();
        Long id = (Long) session.getAttribute("user");
        
        
        
        uiModel.addAttribute("userid",id.toString());
        
		return "myphoto";
	}
	
	@RequestMapping(value="/myphoto",method=RequestMethod.POST)
	public String myphoto(HttpServletRequest request, @RequestParam("myphoto") MultipartFile file) {
		// Get Session
        HttpSession session = request.getSession();
        Long id = (Long) session.getAttribute("user");

        if(!file.isEmpty()) {
        	this.userManager.savemyPhoto(id.toString(), file);
		return "redirect:myprofile";
        }
        return "redirect:myphoto";
	}
	
	@RequestMapping(value="/myorder")
	public ModelAndView myorder(HttpServletRequest request) {
		// Get Session
        HttpSession session = request.getSession();
        Long user_ID = (Long) session.getAttribute("user");
        
        Map<String, Object> myModel = new HashMap<String, Object>();
        
        List<Order> Rlist = this.orderManager.getOrderByUserId(user_ID);
        myModel.put("Rorders", Rlist);
        
        List<Product> Hlist = this.productManager.getProductByOwnerId(user_ID);
        myModel.put("Houses", Hlist);
        
        List<Order> Plist = this.orderManager.getOrderByOwnerId(user_ID);
        myModel.put("Porders", Plist);
        
        return new ModelAndView("myorder", "model", myModel);
	}
	
	@RequestMapping(value="/cancel/{id}")
	public String cancelOrder(@PathVariable("id") int id){
		this.orderManager.cancelOrder(id);
		return "redirect:/myaccount/myorder";
	}
	
	@RequestMapping(value="/delete/{id}")
	public String deleteHouse(@PathVariable("id") int id){
		this.productManager.deleteProduct(id);
		
		List<Order> list=this.orderManager.getOrderByHouseId(id);
		for (Order order : list) {
			int oid = order.getID();
			this.orderManager.cancelOrder(oid);
		}
		return "redirect:/myaccount/myorder";
	}

}
package au.usyd.elec5619.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import au.usyd.elec5619.domain.Order;
import au.usyd.elec5619.service.OrderAdminManager;

@Controller
@RequestMapping(value="/adminorder/**")
public class AdminOrderController {
	
	@Resource(name="orderAdminManager")
	private OrderAdminManager orderAdminManager;
	
	
	@RequestMapping(value="/add")
	public String addOrder(Model uiModel) {
		
		return "add";
	}
	
	@RequestMapping(value="/edit/{id}", method=RequestMethod.GET)
	public String editOrder(@PathVariable("id") int id, Model uiModel) {
		Order order = this.orderAdminManager.getOrderById(id);
		uiModel.addAttribute("order",order);
		return "AdminOrderEditPage";
	}
	
	@RequestMapping(value="/edit/**", method=RequestMethod.POST)
	public String editProduct(@Valid Order order) {
		
		this.orderAdminManager.updateOrder(order);
		System.out.println(order.getID());
		
		return "redirect:/admin/ordertable";
	}
	
	@RequestMapping(value="/delete/{id}", method=RequestMethod.GET)
	public String deleteProduct(@PathVariable("id") int id) {
		
		this.orderAdminManager.deleteOrder(id);
		
		return "redirect:/admin/ordertable";
	}
}
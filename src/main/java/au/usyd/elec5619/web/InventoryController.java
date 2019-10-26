package au.usyd.elec5619.web;

import java.util.Map;
import java.util.HashMap;
import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import au.usyd.elec5619.service.ProductManager;
import au.usyd.elec5619.service.UserManager;
import au.usyd.elec5619.domain.User;

@Controller
@RequestMapping(value = "/**")
public class InventoryController {
	
	protected final Log logger = LogFactory.getLog(getClass());

	@Resource(name = "productManager")
	private ProductManager productManager;
	
	@Resource(name = "userManager")
	private UserManager userManager;
	
	
	@RequestMapping(value = "hello.html", method = RequestMethod.GET)
	public String helloModelAndView() {
		return "redirect:/hello.html/index=1";
	}
	
	@RequestMapping(value = "hello.htm", method = RequestMethod.GET)
	public String hellohtml() {
		return "redirect:/hello.html/index=1";
	}
	
	@RequestMapping(value = "hello.html/index={index}", method = RequestMethod.GET)
	public ModelAndView helloModelAndViewWithIndex(@PathVariable("index") int index, HttpServletRequest request) {
		Map<String,Object> myModel = new HashMap<String, Object>();
		HttpSession session = request.getSession();
        Long id = (Long) session.getAttribute("user");
        if (id == null) {
        	myModel.put("status", "notlogin");
        }
        else {
        	User user = this.userManager.getUserbyId(id);
        	myModel.put("status", user.getUserName());
        }
		String now = (new java.util.Date()).toString();
		logger.info("Returning hello view with " + now);
		logger.info(productManager.countAllProducts());
		myModel.put("now", now);
		myModel.put("products", this.productManager.getProducts(8*index-8));
		myModel.put("count", productManager.countAllProducts());
		return new ModelAndView("hello", "model", myModel);
	}
	
	public void setProductManager(ProductManager productManager) {
		this.productManager = productManager;
	}
}

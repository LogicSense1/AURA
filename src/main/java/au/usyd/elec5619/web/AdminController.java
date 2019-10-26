package au.usyd.elec5619.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import au.usyd.elec5619.service.CommentAdminManager;
import au.usyd.elec5619.service.OrderAdminManager;
import au.usyd.elec5619.service.ProductAdminManager;
import au.usyd.elec5619.service.UserAdminManager;

@Controller
@RequestMapping(value = "/admin/**")
public class AdminController {
	
	@Resource(name = "productAdminManager")
	private ProductAdminManager productAdminManager;
	
	@Resource(name = "userAdminManager")
	private UserAdminManager userAdminManager;
	
	@Resource(name = "orderAdminManager")
	private OrderAdminManager orderAdminManager;
	
	@Resource(name = "commentAdminManager")
	private CommentAdminManager commentAdminManager;
	
	@RequestMapping(value = "/")
	public String adminSetup() {
		return "AdminHome";
	}
	
	@RequestMapping(value = "/producttable")
	public ModelAndView handleproductRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String now = (new java.util.Date()).toString();
		Map<String, Object> myModel = new HashMap<String, Object>();
		myModel.put("now", now);
		myModel.put("products", this.productAdminManager.getProducts());
		return new ModelAndView("AdminProductTable", "model", myModel);
	}
	
	@RequestMapping(value = "/usertable")
	public ModelAndView handleuserRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String now = (new java.util.Date()).toString();
		
		Map<String, Object> myModel = new HashMap<String, Object>();
		myModel.put("now", now);
		myModel.put("users", this.userAdminManager.getUsers());
		
		return new ModelAndView("AdminUserTable", "model", myModel);
	}
	
	@RequestMapping(value = "/ordertable")
	public ModelAndView handleorderRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String now = (new java.util.Date()).toString();
		
		Map<String, Object> myModel = new HashMap<String, Object>();
		myModel.put("now", now);
		myModel.put("products", this.orderAdminManager.getOrders());
		
		return new ModelAndView("AdminOrderTable", "model", myModel);
	}
	
	@RequestMapping(value = "/commenttable")
	public ModelAndView handlecommentRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String now = (new java.util.Date()).toString();
		
		Map<String, Object> myModel = new HashMap<String, Object>();
		myModel.put("now", now);
		myModel.put("comments", this.commentAdminManager.getComments());
		
		return new ModelAndView("AdminCommentTable", "model", myModel);
	}
}

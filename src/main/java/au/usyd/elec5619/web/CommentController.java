package au.usyd.elec5619.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.internal.lang.annotation.ajcDeclareAnnotation;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import antlr.MakeGrammar;
import au.usyd.elec5619.domain.Comment;
import au.usyd.elec5619.domain.Order;
import au.usyd.elec5619.domain.Product;
import au.usyd.elec5619.domain.User;
import au.usyd.elec5619.service.CommentManager;
import au.usyd.elec5619.service.OrderManager;
import au.usyd.elec5619.service.ProductAdminManager;
import au.usyd.elec5619.service.ProductManager;
import au.usyd.elec5619.service.UserManager;

@Controller
@RequestMapping(value = "/house/**")
public class CommentController {

	@Resource(name = "simpleCommentManager")
	private CommentManager scm;

	@Resource(name = "productManager")
	private ProductManager productManager;
	
	@Resource(name = "userManager")
	private UserManager userManager;
	
	@Resource(name = "orderManager")
	private OrderManager orderManager;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	@RequestMapping(value = "/{id}")
	public ModelAndView showComment(HttpServletRequest request, @PathVariable("id") int id, Model model) {
		Map<String, Object> aModel = new HashMap<String, Object>();
		HttpSession session = request.getSession();
        Long userid = (Long) session.getAttribute("user");
        if (userid == null) {
        	aModel.put("status", "notlogin");
        }
        else {
        	User user = this.userManager.getUserbyId(userid);
        	aModel.put("status", user.getUserName());
        }
		
		List<Comment> comments = this.scm.getCommentsByProduct(id);
		Product product = this.productManager.getProductById(id);
		model.addAttribute("house", product);
		System.out.println(product);
		aModel.put("comments", comments);
		return new ModelAndView("commentlist", "model", aModel);
	}

	@RequestMapping(value = "/info/{id}", method = RequestMethod.GET)
	public ModelAndView page(HttpServletRequest request) {

		return new ModelAndView("commentpage");
	}
	
	@RequestMapping(value = "/order={keyword}")
	public String newOrder(@PathVariable("keyword") String keyword, HttpServletRequest request) {
		int id = Integer.parseInt(keyword.split("\\+")[0]);
		String startdate = keyword.split("\\+")[1];
		String enddate = keyword.split("\\+")[2];
		HttpSession session = request.getSession();
		Long userid = (Long) session.getAttribute("user");
		Order order = new Order();
		Product product = this.productManager.getProductById(id);
		order.setUser_ID(Integer.valueOf(userid.toString()));
		order.setCost(product.getPrice());
		order.setCreatedTime(sdf.format(new Date()));
		order.setCurrentStatus("running");
		order.setStartDate(startdate);
		order.setEndDate(enddate);
		order.setOwner_ID(product.getOwnerID());
		order.setHouse_ID(product.getID());
		this.orderManager.addOrder(order);
		return "redirect:/myaccount/myorder";
	}

	@RequestMapping(value = "/info/{id}", method = RequestMethod.POST)
	public String addComment(@PathVariable("id") int id, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Long userid = (Long) session.getAttribute("user");
		Comment comment = new Comment();
		int score = Integer.parseInt(request.getParameter("score"));
		comment.setTime(new Date());
		comment.setUserId(userid);
		comment.setProductId(id);
		comment.setScore(score);
		comment.setContent(request.getParameter("contents"));
		this.scm.addComment(comment);
		return "redirect:/house/" + String.valueOf(id);
	}

	@RequestMapping(value = "/delete/{id}")
	public ModelAndView delete(HttpServletRequest request, @PathVariable("id") int id) throws Exception {
		this.scm.deleteComment(id);
		return new ModelAndView("redirect:/house/" + String.valueOf(id));
	}

	@RequestMapping(value = "/getcommentsbyuser")
	public ModelAndView getCommentsByUser(HttpServletRequest request) throws Exception {
		Map<String, Object> aModel = new HashMap<String, Object>();
		List<Comment> comments = this.scm.getCommentsByUser(Long.parseLong(request.getParameter("userId")));
		aModel.put("comments", comments);
		return new ModelAndView("commentlist", "model", aModel);
	}

	@RequestMapping(value = "/getcommentsbyproduct")
	public ModelAndView getCommentsByProduct(HttpServletRequest request) throws Exception {
		Map<String, Object> aModel = new HashMap<String, Object>();
		List<Comment> comments = this.scm.getCommentsByProduct(Long.parseLong(request.getParameter("productId")));
		aModel.put("comments", comments);
		return new ModelAndView("commentlist", "model", aModel);
	}

}
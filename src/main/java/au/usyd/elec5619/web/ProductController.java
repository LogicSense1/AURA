package au.usyd.elec5619.web;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.naming.directory.SearchControls;
import javax.naming.spi.DirStateFactory.Result;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.eclipse.jdt.internal.compiler.ast.ThisReference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.maps.*;
import com.google.maps.errors.ApiException;
import com.google.maps.model.GeocodingResult;
import com.google.maps.model.LatLng;
import au.usyd.elec5619.domain.Product;
import au.usyd.elec5619.domain.User;
import au.usyd.elec5619.service.ProductManager;
import au.usyd.elec5619.service.UserManager;




@Controller
@RequestMapping(value = "/product/**")
public class ProductController {
	
	private GeoApiContext context = new GeoApiContext.Builder()
			.apiKey("AIzaSyCzOablY1uPpncQ49oiU5i93gPZ2jWTjeA")
            .build();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	Date date = new Date();
	
	@Resource(name="productManager")
	private ProductManager productManager;
	
	@Resource(name = "userManager")
	private UserManager userManager;
	
	
	@RequestMapping(value = "/add")
	public String addProduct(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		Long id = (Long) session.getAttribute("user");
		if (id == null) {
        	model.addAttribute("userid", "notlogin");
        }
        else {
        	model.addAttribute("userid", userManager.getUserbyId(id).getUserName());
        }
		return "add";
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addProduct(HttpServletRequest httpServletRequest, HttpServletRequest request, Model model) throws Exception {
		HttpSession session = request.getSession();
		Long id = (Long) session.getAttribute("user");
		Product product = new Product();
		product.setName(httpServletRequest.getParameter("name"));
		product.setPrice(Integer.valueOf(httpServletRequest.getParameter("price")));
		product.setLocation(httpServletRequest.getParameter("location"));
		GeocodingResult[] results = GeocodingApi.geocode(context, product.getLocation()).await();
		product.setLatitude(results[0].geometry.location.lat);
		product.setLongitude(results[0].geometry.location.lng);
		product.setCreatedTime(sdf.format(new Date()));
		product.setNumberOfRooms(Integer.valueOf(httpServletRequest.getParameter("rooms")));
		product.setStatus("available");
		product.setParkingAvailable(Integer.valueOf(httpServletRequest.getParameter("park")));
		product.setHouseType(httpServletRequest.getParameter("type"));
		product.setAvailableStartTime(httpServletRequest.getParameter("start"));
		product.setAvailableEndTime(httpServletRequest.getParameter("end"));
		product.setDescription(httpServletRequest.getParameter("description"));
		product.setOwnerID(Integer.valueOf(id.toString()));
		Long house_id = (long) this.productManager.addProduct(product);
		return "redirect:uploadphoto/" + house_id.toString();
	}
	
	
	@RequestMapping(value="/uploadphoto/{ID}")
	public String myphoto(HttpServletRequest request,Model model) {
		HttpSession session = request.getSession();
		Long id = (Long) session.getAttribute("user");
		if (id == null) {
        	model.addAttribute("userid", "notlogin");
        }
        else {
        	model.addAttribute("userid", userManager.getUserbyId(id).getUserName());
        }
		return "uploadphoto";
	}
	
	@RequestMapping(value="/uploadphoto/{ID}",method=RequestMethod.POST)
	public String uploadphoto(HttpServletRequest request, @RequestParam("file") MultipartFile[] file, @PathVariable("ID") Long id) {
		// Get Session
        Long i = (long) 0;
        for (MultipartFile multipartFile : file) {
        	if(!multipartFile.isEmpty()) {
            	this.productManager.savemyPhoto(id.toString() + "-" + i.toString(), multipartFile);
            i++;
        	}
        	else return "";
        }
        return "redirect:/hello.html";
	}
	
	@RequestMapping(value = "/search={keyword}/index={index}", method = RequestMethod.GET)
	public ModelAndView searchHouses(@PathVariable("keyword") String keyword, @PathVariable("index") int index, HttpServletRequest request){
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
		myModel.put("count",  this.productManager.countSearchProducts(keyword));
		myModel.put("products", this.productManager.searchProducts(keyword, 8*index-8));
		return new ModelAndView("search", "model", myModel);
	}
	
	@RequestMapping(value = "/uploadImg", method = RequestMethod.POST)
	public String uploadImg(@RequestParam(value = "img")MultipartFile img, HttpServletRequest httpServletRequest) {
		
		
		
		
		return "redirect:/hello.htm";
	}
	
}
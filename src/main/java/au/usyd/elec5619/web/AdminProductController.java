package au.usyd.elec5619.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import au.usyd.elec5619.domain.Product;
import au.usyd.elec5619.service.ProductAdminManager;

@Controller
@RequestMapping(value="/adminproduct/**")
public class AdminProductController {
	
	@Resource(name="productAdminManager")
	private ProductAdminManager productAdminManager;
	
	
	@RequestMapping(value="/add")
	public String addProduct(Model uiModel) {
		
		return "add";
	}
	
	@RequestMapping(value="/edit/{id}", method=RequestMethod.GET)
	public String editProduct(@PathVariable("id") int id, Model uiModel) {
		Product product = this.productAdminManager.getProductById(id);
		uiModel.addAttribute("product",product);
		return "AdminProductEditPage";
	}
	
	@RequestMapping(value="/edit/**", method=RequestMethod.POST)
	public String editProduct(Product product, HttpServletRequest request) {
		product.setLatitude(Double.valueOf(request.getParameter("latitude")));
		product.setLongitude(Double.valueOf(request.getParameter("longitude")));
		this.productAdminManager.updateProduct(product);
		System.out.println(product.getLatitude());
		return "redirect:/admin/producttable";
	}
	
	@RequestMapping(value="/delete/{id}", method=RequestMethod.GET)
	public String deleteProduct(@PathVariable("id") int id) {
		
		this.productAdminManager.deleteProduct(id);
		
		return "redirect:/admin/producttable";
	}
}

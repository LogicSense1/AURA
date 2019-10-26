package au.usyd.elec5619.service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import au.usyd.elec5619.domain.Product;

public interface ProductAdminManager extends Serializable{
	
	public List<Product> getProducts();
	
	public Product getProductById(int id);
	
	public void updateProduct(Product product);
	
	public void deleteProduct(int id);
	
}
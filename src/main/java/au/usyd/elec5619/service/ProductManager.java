package au.usyd.elec5619.service;

import java.io.Serializable;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import au.usyd.elec5619.domain.Product;

public interface ProductManager extends Serializable {

	public void increasePrice(int percentage);

	public List<Product> getProducts(int indexnumber);
	
	public int addProduct(Product product);
	
	public Product getProductById(int id);
	
	public void updateProduct(Product product);
	
	public void deleteProduct(int id);
	
	public List<Product> searchProducts(String keyword, int indexnumber);
	
	public long countAllProducts();
	
	public long countSearchProducts(String keyword);

	void savemyPhoto(String id, MultipartFile file);	

	public List<Product> getProductByOwnerId(Long ownerID);
}

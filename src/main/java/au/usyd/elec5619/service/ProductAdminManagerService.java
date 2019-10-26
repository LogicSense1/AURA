package au.usyd.elec5619.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import au.usyd.elec5619.dao.ProductAdminManagerDAO;
import au.usyd.elec5619.domain.Product;
import au.usyd.elec5619.domain.User;

@Service(value="productAdminManager")
@Transactional
public class ProductAdminManagerService implements ProductAdminManager{
	///
	private List<Product> products;
	///
	@Autowired
	private ProductAdminManagerDAO productAdminManagerDAO;
	
	public Product getProductById(int id) {
		return this.productAdminManagerDAO.getProductById(id);
	}

	@Override
	public void updateProduct(Product product) {
		this.productAdminManagerDAO.updateProduct(product);
		
	}
	
	@Override
	public void deleteProduct(int id) {
		this.productAdminManagerDAO.deleteProduct(id);
		
	}
	
	@Override
	public List<Product> getProducts() {
		return this.productAdminManagerDAO.getProducts();
	}
	
	public void setProducts(List<Product> products) {
		this.products = products;
	}

}
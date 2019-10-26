package au.usyd.elec5619.service;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import au.usyd.elec5619.domain.Product;

@Service(value = "productManager")
@Transactional
public class DatabaseProductManager implements ProductManager{
	
	private SessionFactory sessionFactory;
	
	@Autowired
	public void setSessionfactory(SessionFactory sf) {
		this.sessionFactory = sf;
	}
	
	@Override
	public int addProduct(Product product) {
		this.sessionFactory.getCurrentSession().save(product);
		return product.getID();
	}
	
	
	public void updateProduct(Product product) {
		Session currentSession = this.sessionFactory.getCurrentSession();
		currentSession.merge(product);
	}
	
	public void deleteProduct(int id) {
		Session currentSession = this.sessionFactory.getCurrentSession();
		Product product = (Product) currentSession.get(Product.class, id);
		currentSession.delete(product);
	}
	
	@Override
	public List<Product> getProducts(int indexnumber) {
		return this.sessionFactory.getCurrentSession().createQuery("from Product order by price")
				.setFirstResult(indexnumber)
				.setMaxResults(8)
				.list();
	}
	
	@Override
	public long countAllProducts() {
		return (Long) this.sessionFactory.getCurrentSession().createQuery("select count(*) from Product").uniqueResult();
	}
	
	@Override
	public long countSearchProducts(String input) {
		String[] keyword = input.split("\\+");
		int number = Integer.valueOf(keyword[3]);
		String hqlString = "SELECT count(p) FROM Product p WHERE p.location like :keyword and p.availableStartTime != null and p.availableStartTime <= :startdate and p.availableEndTime != null and p.availableEndTime >= :enddate and p.numberOfRooms != null and p.numberOfRooms >= :number order by price";
		return (Long) this.sessionFactory.getCurrentSession().createQuery(hqlString)
				.setParameter("keyword", "%" + keyword[0].toUpperCase() + "%")
				.setInteger("number", number)
				.setDate("startdate", Date.valueOf(keyword[1]))
				.setDate("enddate", Date.valueOf(keyword[2]))
				.uniqueResult();
	}
	
	@Override
	public List<Product> searchProducts(String input, int indexnumber) {
		String[] keyword = input.split("\\+");
		int number = Integer.valueOf(keyword[3]);
		String hqlString = "SELECT p FROM Product p WHERE p.location like :keyword and p.availableStartTime != null and p.availableStartTime <= :startdate and p.availableEndTime != null and p.availableEndTime >= :enddate and p.numberOfRooms != null and p.numberOfRooms >= :number order by price";
		return this.sessionFactory.getCurrentSession().createQuery(hqlString)
				.setParameter("keyword", "%" + keyword[0].toUpperCase() + "%")
				.setInteger("number", number)
				.setDate("startdate", Date.valueOf(keyword[1]))
				.setDate("enddate", Date.valueOf(keyword[2]))
				.setFirstResult(indexnumber)
				.setMaxResults(8)
				.list();
				
	}
	
	
	@Override
	public void savemyPhoto(String id, MultipartFile file) {
		String pathroot="C:\\Users\\Wentian Xia\\Documents\\workspace-sts-3.9.8.RELEASE\\springapp\\src\\\\main\\webapp\\";
		String path ="resources/images/"+"house-"+ id+".jpg";
		Long new_id = (long) (Integer.valueOf(id.split("-")[1]));
		File file_1=new File(pathroot+path);
		while(file_1.exists()) {
			new_id = (long) (new_id + 1);
			path = "resources/images/"+ "house-" + id.split("-")[0] + "-" + new_id.toString() +".jpg";
			file_1 = new File(pathroot + path);
		}
		try {
			file.transferTo(file_1);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void increasePrice(int percentage) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Product getProductById(int id) {
		Session currentSession = this.sessionFactory.getCurrentSession();
		Product product = (Product) currentSession.get(Product.class, id);
		return product;
	}

	@Override
	public List<Product> getProductByOwnerId(Long ownerID) {
		Session currentSession = this.sessionFactory.getCurrentSession();
		List<Product> list=currentSession.createQuery("from Product where ownerID =:OwnerID").setLong("OwnerID", ownerID).list();
		return list;
	}
	
	
	
}

package au.usyd.elec5619.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.springframework.stereotype.Repository;

import au.usyd.elec5619.domain.Product;

@Repository(value = "ProductAdminManagerDAO")
public class ProductAdminManagerDAO {

    @Resource
    private SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public Product getProductById(int id) {
		Session currentSession = this.sessionFactory.getCurrentSession();
		Product product = (Product) currentSession.get(Product.class, id);
		return product;
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
	
	public List<Product> getProducts() {
		return this.sessionFactory.getCurrentSession().createQuery("FROM Product").list();
	}
}
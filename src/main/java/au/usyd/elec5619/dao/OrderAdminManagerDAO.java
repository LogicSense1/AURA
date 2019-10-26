package au.usyd.elec5619.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.springframework.stereotype.Repository;

import au.usyd.elec5619.domain.Order;

@Repository(value = "OrderAdminManagerDAO")
public class OrderAdminManagerDAO {

    @Resource
    private SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public Order getOrderById(int id) {
		Session currentSession = this.sessionFactory.getCurrentSession();
		Order order = (Order) currentSession.get(Order.class, id);
		return order;
	}
	
	public void updateOrder(Order order) {
		Session currentSession = this.sessionFactory.getCurrentSession();
		currentSession.merge(order);
	}
	
	public void deleteOrder(int id) {
		Session currentSession = this.sessionFactory.getCurrentSession();
		Order order = (Order) currentSession.get(Order.class, id);
		currentSession.delete(order);
	}
	
	public List<Order> getOrders() {
		return this.sessionFactory.getCurrentSession().createQuery("FROM Order").list();
	}
}
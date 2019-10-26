package au.usyd.elec5619.service;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import au.usyd.elec5619.domain.Order;
import au.usyd.elec5619.domain.Product;

@Service(value = "orderManager")
@Transactional
public class DatabaseOrderManager implements OrderManager{

	private SessionFactory sessionFactory;
	
	@Autowired
	public void setSessionfactory(SessionFactory sf) {
		this.sessionFactory = sf;
	}
	
	@Override
	public List<Order> getOrders(int indexnumber) {
		return this.sessionFactory.getCurrentSession().createQuery("from Orders order by ID").list();
	}

	@Override
	public void addOrder(Order order) {
		this.sessionFactory.getCurrentSession().save(order);
	}

	@Override
	public Order getOrderById(int id) {
		Session currentSession = this.sessionFactory.getCurrentSession();
		Order order = (Order) currentSession.get(Order.class, id);
		return order;
	}
	
	@Override
	public List<Order> getOrderByUserId(Long user_ID) {
		Session currentSession = this.sessionFactory.getCurrentSession();
		List<Order> list=currentSession.createQuery("from Order where user_ID =:User_ID").setLong("User_ID", user_ID).list();
		return list;
	}
	
	public List<Order> getOrderByOwnerId(Long owner_ID) {
		Session currentSession = this.sessionFactory.getCurrentSession();
		List<Order> list=currentSession.createQuery("from Order where owner_ID =:Owner_ID").setLong("Owner_ID", owner_ID).list();
		return list;
	}

	public List<Order> getOrderByHouseId(int house_ID) {
		Session currentSession = this.sessionFactory.getCurrentSession();
		List<Order> list=currentSession.createQuery("from Order where house_ID =:House_ID").setParameter("House_ID", house_ID).list();
		return list;
	}
	
	@Override
	public void updateOrder(Order order) {
		Session currentSession = this.sessionFactory.getCurrentSession();
		currentSession.merge(order);
		
	}

	@Override
	public void deleteOrder(int id) {
		Session currentSession = this.sessionFactory.getCurrentSession();
		Order order = (Order) currentSession.get(Order.class, id);
		currentSession.delete(order);
	}
	
	public void cancelOrder(int id) {
		Session currentSession = this.sessionFactory.getCurrentSession();
		Order order = (Order) currentSession.get(Order.class, id);
		
		order.setCurrentStatus("canceled");
		currentSession.merge(order);
	}

}

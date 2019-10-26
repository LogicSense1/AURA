package au.usyd.elec5619.service;

import java.io.Serializable;
import java.util.List;

import au.usyd.elec5619.domain.Order;


public interface OrderManager extends Serializable{
	
	public List<Order> getOrders(int indexnumber);
	
	public void addOrder(Order order);
	
	public Order getOrderById(int id);
	
	public void updateOrder(Order order);
	
	public void cancelOrder(int id);
	
	public void deleteOrder(int id);
	
	public List<Order> getOrderByHouseId(int house_ID);
	
	public List<Order> getOrderByUserId(Long user_ID);
	
	public List<Order> getOrderByOwnerId(Long owner_ID);
}

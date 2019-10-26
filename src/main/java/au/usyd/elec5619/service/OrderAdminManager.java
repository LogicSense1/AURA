package au.usyd.elec5619.service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import au.usyd.elec5619.domain.Order;

public interface OrderAdminManager extends Serializable{
	
	public List<Order> getOrders();
	
	public Order getOrderById(int id);
	
	public void updateOrder(Order order);
	
	public void deleteOrder(int id);
	
}
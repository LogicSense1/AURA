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

import au.usyd.elec5619.dao.OrderAdminManagerDAO;
import au.usyd.elec5619.domain.Order;
import au.usyd.elec5619.domain.User;

@Service(value="orderAdminManager")
@Transactional
public class OrderAdminManagerService implements OrderAdminManager{
	///
	private List<Order> orders;
	///
	@Autowired
	private OrderAdminManagerDAO orderAdminManagerDAO;
	
	public Order getOrderById(int id) {
		return this.orderAdminManagerDAO.getOrderById(id);
	}

	@Override
	public void updateOrder(Order order) {
		this.orderAdminManagerDAO.updateOrder(order);
		
	}
	
	@Override
	public void deleteOrder(int id) {
		this.orderAdminManagerDAO.deleteOrder(id);
		
	}
	
	@Override
	public List<Order> getOrders() {
		return this.orderAdminManagerDAO.getOrders();
	}
	
	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}

}
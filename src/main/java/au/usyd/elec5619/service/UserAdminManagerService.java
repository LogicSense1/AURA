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

import au.usyd.elec5619.dao.UserAdminManagerDAO;
import au.usyd.elec5619.domain.User;

@Service(value="userAdminManager")
@Transactional
public class UserAdminManagerService implements UserAdminManager{

	@Autowired
	private UserAdminManagerDAO userAdminManagerDAO;
	
	public User getUserbyId(Long id) {
		return this.userAdminManagerDAO.getUserbyId(id);
	}
	
	@Override
	public void updateUser(User user) {
		this.userAdminManagerDAO.updateUser(user);
		
	}

	@Override
	public void deleteUser(long id) {
		this.userAdminManagerDAO.deleteUser(id);
		
	}

	@Override
	public List<User> getUsers() {
		return this.userAdminManagerDAO.getUsers();
	}
	

}
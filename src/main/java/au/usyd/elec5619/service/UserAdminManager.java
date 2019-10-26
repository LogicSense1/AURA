package au.usyd.elec5619.service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;


import au.usyd.elec5619.domain.User;


public interface UserAdminManager extends Serializable{
	
	public User getUserbyId(Long id);

	public List<User> getUsers();
	public void updateUser(User user);
	public void deleteUser(long id);

}
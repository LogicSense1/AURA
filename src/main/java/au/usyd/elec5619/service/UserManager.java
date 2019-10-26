package au.usyd.elec5619.service;

import java.io.Serializable;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import au.usyd.elec5619.domain.User;


public interface UserManager extends Serializable{
	
	public User getUserbyId(Long id);
	
	public Map<String, Object> userLogin(String email,String password);
	public Map<String, Object> userRegister(String email,String password,String password_again,String username, String realname,String phone);
	public void savemyPhoto(String id, MultipartFile file);
	public String userProfileEdit(User user, String password_again);
}
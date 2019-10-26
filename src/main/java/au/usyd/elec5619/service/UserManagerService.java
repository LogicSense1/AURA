package au.usyd.elec5619.service;

import java.io.File;
import java.io.IOException;
import java.security.MessageDigest;
import java.util.HashMap;
import java.util.Map;

import javax.xml.bind.DatatypeConverter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.document.AbstractPdfStamperView;

import au.usyd.elec5619.dao.UserManagerDAO;
import au.usyd.elec5619.domain.User;

@Service(value = "userManager")
@Transactional
public class UserManagerService implements UserManager {

	private String getMD5Hash(String data) {
		String result = null;
		try {
			MessageDigest digest = MessageDigest.getInstance("MD5");
			byte[] hash = digest.digest(data.getBytes("UTF-8"));
			return bytesToHex(hash); // make it printable
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return result;
	}

	private String bytesToHex(byte[] hash) {
		return DatatypeConverter.printHexBinary(hash);
	}

	@Autowired
	private UserManagerDAO userManagerDAO;

	public User getUserbyId(Long id) {
		return this.userManagerDAO.getUserbyId(id);
	}

	public Map<String, Object> userLogin(String email, String password) {
		Map<String, Object> map = new HashMap<String, Object>();

		User user = this.userManagerDAO.getUserbyEmail(email);
		if (user != null) {
			if (user.getPassword().equals(getMD5Hash(password))) {
				map.put("user", user);
			} else {
				map.put("error", "Wrong password!");
			}
		} else {
			map.put("error", "Wrong email!");
		}
		return map;
	}

	public Map<String, Object> userRegister(String email, String password, String password_again, String username,
			String realname, String phone) {
		Map<String, Object> map = new HashMap<String, Object>();
		User user = new User();

		if (email.isEmpty() || password.isEmpty() || password_again.isEmpty() || username.isEmpty()) {
			map.put("error", "Empty input!");
			return map;
		}
		if (this.userManagerDAO.getUserbyEmail("email") == null) {
			if (password.equals(password_again)) {

				user.setEmail(email);
				user.setPassword(getMD5Hash(password));
				user.setPhone(phone);
				user.setUserName(username);
				user.setRealName(realname);

				this.userManagerDAO.addUser(user);

				map.put("user", user);
				return map;
			} else {
				map.put("error", "Password and Re-entered Password do not match!");
				return map;
			}
		} else {
			map.put("error", "Email existed!");
			return map;
		}

	}

	public String userProfileEdit(User user, String password_again) {
		String password = user.getPassword();
		if (password.equals(password_again)) {
			user.setPassword(getMD5Hash(password_again));
			this.userManagerDAO.updateUser(user);
			return null;
		}
		return "Password and Re-entered Password do not match!";
	}

	@Override
	public void savemyPhoto(String id, MultipartFile file) {
		String pathroot="C:\\Users\\Wentian Xia\\Documents\\workspace-sts-3.9.8.RELEASE\\springapp\\src\\main\\webapp";
		String path ="/resources/images/"+id+".jpg";
		
		File file_1=new File(pathroot+path);
		if (file_1.exists()) {
			file_1.delete();
		}
		try {
			file.transferTo(file_1);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
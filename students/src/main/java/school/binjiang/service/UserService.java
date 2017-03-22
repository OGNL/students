package school.binjiang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import school.binjiang.mapper.UserMapper;
import school.binjiang.po.User;

public interface UserService  {
	
	public void add(User user);
	
	public void delete(int id);
	
	public void updatePwdAndRole(User user);
	
	public List<User> showAll();
	
	public User showByName(String name);
	

}

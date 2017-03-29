package school.binjiang.service;

import java.util.List;

import school.binjiang.po.User;

public interface UserService  {
	
	public void add(User user);
	
	public void delete(int id);
	
	public void updatePwdAndRole(User user);
	
	public void updatePwd(User user);
	
	public List<User> showAll();
	
	public User showByName(String name);
	
	public User showById(int id);
	
	public List<User> showByNameRole(User user);	
	

}

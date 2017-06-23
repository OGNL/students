package school.binjiang.service;

import java.util.List;

import school.binjiang.po.User;

public interface UserService  {
	
	 void add(User user);
	
	 void delete(int id);
	
	 void updatePwdAndRole(User user);
	
	 void updatePwd(User user);
	
	 List<User> showAll();
	
	 User showByName(String name);
	
	 User showById(int id);
	
	 List<User> showByNameRole(User user);
	

}

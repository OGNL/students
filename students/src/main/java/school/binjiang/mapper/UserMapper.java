package school.binjiang.mapper;

import java.util.List;

import school.binjiang.po.User;

public interface UserMapper {
	
	public void add(User user);
	
	public void delete(int id);
	
	public void updatePwdAndRole(User user);
	
	public List<User> findAll();
	
	public User findByName(String name);

}
package school.binjiang.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import school.binjiang.mapper.UserMapper;
import school.binjiang.po.User;
import school.binjiang.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;

	public void add(User user) {
		userMapper.add(user);
	}

	public void delete(int id) {
		userMapper.delete(id);
	}

	public void updatePwdAndRole(User user) {
		userMapper.updatePwdAndRole(user);
	}

	public List<User> showAll() {
		return userMapper.findAll();
	}

	public User showByName(String name) {
		return userMapper.findByName(name);
	}

	public void updatePwd(User user) {
		userMapper.updatePwd(user);
		
	}

	public List<User> showByNameRole(User user) {
		return userMapper.findByNameRole(user);
	}

	public User showById(int id) {
		return userMapper.findById(id);
	}

}

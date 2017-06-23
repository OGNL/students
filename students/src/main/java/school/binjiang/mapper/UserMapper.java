package school.binjiang.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;
import school.binjiang.po.User;

@Repository
public interface UserMapper {
	
	 void add(User user);
	
	 void delete(int id);
	
	 void updatePwdAndRole(User user);
	
	 void updatePwd(User user);
	
	 List<User> findAll();
	
	 User findByName(String name);
	
	 User findById(int id);
	
	 List<User> findByNameRole(User user);

}

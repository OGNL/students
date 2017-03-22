package school.binjiang.mapper;

import java.util.List;

import school.binjiang.po.Role;

public interface RoleMapper {
	
	public void add(Role role);
	
	public void delete(int id);
	
	public void update(Role role);
	
	public List<Role> findAll();
}

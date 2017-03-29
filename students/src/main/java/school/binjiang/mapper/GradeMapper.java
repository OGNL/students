package school.binjiang.mapper;

import java.util.List;

import school.binjiang.po.Grade;
import school.binjiang.po.Student;

public interface GradeMapper {
	
	public void add(Grade grade);
	
	public void delete(int id);
	
	public void update(Grade grade);
	
	public Grade findById(int id);
	
	public Grade findByStuId(int stuId);
	
	public List<Grade> findByNoNameGenderMajor(Student student);
}

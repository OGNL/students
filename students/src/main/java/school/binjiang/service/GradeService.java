package school.binjiang.service;

import java.util.List;

import school.binjiang.po.Grade;
import school.binjiang.po.Student;

public interface GradeService {
	
	public void add(Grade grade);
	
	public void delete(int id);
	
	public void update(Grade grade);
	
	public Grade showById(int id);
	
	public Grade showByStuId(int stuId);
	
	public List<Grade> showByNoNameGenderMajor(Student student);

}

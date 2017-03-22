package school.binjiang.service;

import java.util.List;

import school.binjiang.po.PageBean;
import school.binjiang.po.Student;

public interface StudentService {
	
	public void add(Student student);
	
	public void delete(int id);
	
	public void update(Student student);
	
	public Student showByStuNo(String stuNo);
	
	public List<Student> showByNoNameGenderMajor(PageBean page);
	
	public int getStudentCount(PageBean page);
	
	public Student showById(int id);
	
	public Student showByNoAndName(Student student);

}

package school.binjiang.mapper;

import java.util.List;

import school.binjiang.po.PageBean;
import school.binjiang.po.Student;

public interface StudentMapper {
	
	public void add(Student student);
	
	public void delete(int id);
	
	public void update(Student student);
	
	public Student findByStuNo(String stuNo);
	
	public List<Student> findByNoNameGenderMajor(PageBean page);
	
	public int getStudentCount(PageBean page);
	
	public Student findById(int id);
	
	public Student findByNoAndName(Student student);

}

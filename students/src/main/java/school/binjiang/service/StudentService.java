package school.binjiang.service;

import java.util.List;

import school.binjiang.po.PageBean;
import school.binjiang.po.Student;
import school.binjiang.vo.StudentVo;

public interface StudentService {
	
	 void add(Student student);
	
	 void delete(int id);
	
	 void update(Student student);
	
	 Student showByStuNo(String stuNo);
	
	 List<Student> showByNoNameGenderMajor(PageBean page);
	
	 int getStudentCount(PageBean page);
	
	 Student showById(int id);
	
	 Student showByNoAndName(Student student);
	
	public List<StudentVo> showNumByMajor(StudentVo stuVo);
	
	public List<StudentVo> showNumByGender(StudentVo stuVo);
	
	public List<StudentVo> showNumByAddress(StudentVo stuVo);

}

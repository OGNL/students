package school.binjiang.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;
import school.binjiang.po.PageBean;
import school.binjiang.po.Student;
import school.binjiang.vo.StudentVo;

@Repository
public interface StudentMapper {
	
	 void add(Student student);
	
	 void delete(int id);
	
	 void update(Student student);
	
	 Student findByStuNo(String stuNo);
	
	 List<Student> findByNoNameGenderMajor(PageBean page);
	
	 int getStudentCount(PageBean page);
	
	 Student findById(int id);
	
	 Student findByNoAndName(Student student);
	
	 List<StudentVo> findNumByMajor(StudentVo stuVo);
	
	 List<StudentVo> findNumByGender(StudentVo stuVo);
	
	 List<StudentVo> findNumByAddress(StudentVo stuVo);

}

package school.binjiang.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;
import school.binjiang.po.Grade;
import school.binjiang.po.Student;

@Repository
public interface GradeMapper {
	
	 void add(Grade grade);
	
	 void delete(int id);
	
	 void update(Grade grade);
	
	 Grade findById(int id);
	
	 Grade findByStuId(int stuId);
	
	 List<Grade> findByNoNameGenderMajor(Student student);
}

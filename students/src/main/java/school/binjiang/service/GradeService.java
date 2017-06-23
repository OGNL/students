package school.binjiang.service;

import java.util.List;

import school.binjiang.po.Grade;
import school.binjiang.po.Student;

public interface GradeService {
	
	 void add(Grade grade);

	 void delete(int id);

	 void update(Grade grade);

	 Grade showById(int id);

	 Grade showByStuId(int stuId);

	 List<Grade> showByNoNameGenderMajor(Student student);

}

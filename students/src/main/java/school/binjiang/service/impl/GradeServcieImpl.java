package school.binjiang.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import school.binjiang.mapper.GradeMapper;
import school.binjiang.po.Grade;
import school.binjiang.po.Student;
import school.binjiang.service.GradeService;

import java.util.List;

@Service
public class GradeServcieImpl implements GradeService {
	
	@Autowired
	private GradeMapper gradeMapper;

	public void add(Grade grade) {
		gradeMapper.add(grade);
	}

	public void delete(int id) {
		gradeMapper.delete(id);

	}

	public void update(Grade grade) {
		gradeMapper.update(grade);

	}

	public Grade showById(int id) {
		return gradeMapper.findById(id);
	}

	public List<Grade> showByNoNameGenderMajor(Student student) {
		return gradeMapper.findByNoNameGenderMajor(student);
	}

	public Grade showByStuId(int stuId) {
		return gradeMapper.findByStuId(stuId);
	}

}

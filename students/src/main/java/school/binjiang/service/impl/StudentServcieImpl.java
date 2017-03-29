package school.binjiang.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import school.binjiang.mapper.StudentMapper;
import school.binjiang.po.PageBean;
import school.binjiang.po.Student;
import school.binjiang.service.StudentService;
import school.binjiang.vo.StudentVo;

@Service
public class StudentServcieImpl implements StudentService {

	@Autowired
	private StudentMapper stuMapper;
	
	public void add(Student student) {
		stuMapper.add(student);
	}

	public void delete(int id) {
		stuMapper.delete(id);
	}

	public void update(Student student) {
		stuMapper.update(student);
	}

	public List<Student> showByNoNameGenderMajor(PageBean page) {
		return stuMapper.findByNoNameGenderMajor(page);
	}

	public int getStudentCount(PageBean page) {
		return stuMapper.getStudentCount(page);
	}

	public Student showByStuNo(String stuNo) {
		return stuMapper.findByStuNo(stuNo);
	}

	public Student showById(int id) {
		return stuMapper.findById(id);
	}

	public Student showByNoAndName(Student student) {
		return stuMapper.findByNoAndName(student);
	}

	public List<StudentVo> showNumByMajor(StudentVo stuVo) {
		return stuMapper.findNumByMajor(stuVo);
	}

	public List<StudentVo> showNumByGender(StudentVo stuVo) {
		return stuMapper.findNumByGender(stuVo);
	}

	public List<StudentVo> showNumByAddress(StudentVo stuVo) {
		return stuMapper.findNumByAddress(stuVo);
	}

}

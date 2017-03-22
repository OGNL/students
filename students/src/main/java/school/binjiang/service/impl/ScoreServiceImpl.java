package school.binjiang.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import school.binjiang.mapper.ScoreMapper;
import school.binjiang.po.Score;
import school.binjiang.po.Student;
import school.binjiang.service.ScoreService;

@Service
public class ScoreServiceImpl implements ScoreService {
	
	@Autowired
	private ScoreMapper scoMapper;

	public void add(Score score) {
		scoMapper.add(score);
	}

	public void delete(int id) {
		scoMapper.delete(id);
	}

	public void update(Score score) {
		scoMapper.update(score);
	}

	public List<Score> showByNoNameMajor(Student student) {
		return scoMapper.findByNoNameMajor(student);
	}

	public Score showById(int id) {
		return scoMapper.findById(id);
	}

	public Score showByStuId(int stuId) {
		return scoMapper.findByStuId(stuId);
	}

}

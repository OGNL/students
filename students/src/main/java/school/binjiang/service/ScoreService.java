package school.binjiang.service;

import java.util.List;

import school.binjiang.po.Score;
import school.binjiang.po.Student;

public interface ScoreService {
	
	public void add(Score score);
	
	public void delete(int id);
	
	public void update(Score score);
	
	public List<Score> showByNoNameMajor(Student student);
	
	public Score showById(int id);
	
	public Score showByStuId(int stuId);

}

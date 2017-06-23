package school.binjiang.service;

import java.util.List;

import school.binjiang.po.Score;
import school.binjiang.po.Student;

public interface ScoreService {
	
	 void add(Score score);
	
	 void delete(int id);
	
	 void update(Score score);
	
	 List<Score> showByNoNameMajor(Student student);
	
	 Score showById(int id);
	
	 Score showByStuId(int stuId);

}

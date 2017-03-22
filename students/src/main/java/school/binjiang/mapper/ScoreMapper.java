package school.binjiang.mapper;

import java.util.List;

import school.binjiang.po.Score;
import school.binjiang.po.Student;

public interface ScoreMapper {
	
	public void add(Score score);
	
	public void delete(int id);
	
	public void update(Score score);
	
	public List<Score> findByNoNameMajor(Student student);
	
	public Score findById(int id);
	
	public Score findByStuId(int stuId);

}

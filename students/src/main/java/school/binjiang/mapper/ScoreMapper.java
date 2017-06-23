package school.binjiang.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;
import school.binjiang.po.Score;
import school.binjiang.po.Student;

@Repository
public interface ScoreMapper {
	
	 void add(Score score);
	
	 void delete(int id);
	
	 void update(Score score);
	
	 List<Score> findByNoNameMajor(Student student);
	
	 Score findById(int id);
	
	 Score findByStuId(int stuId);

}

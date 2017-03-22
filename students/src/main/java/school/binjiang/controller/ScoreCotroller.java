package school.binjiang.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.sf.json.JSONObject;
import school.binjiang.po.Score;
import school.binjiang.po.Student;
import school.binjiang.service.ScoreService;
import school.binjiang.service.StudentService;

@Controller
@RequestMapping("/score")
public class ScoreCotroller {
	
	@Autowired
	private ScoreService scoService;
	@Autowired
	private StudentService stuService;

	@RequestMapping("/fuzzyQuery.action")
	public ModelAndView fuzzyQuery(Student stu){
		List<Score> list = scoService.showByNoNameMajor(stu);
		ModelAndView mv = new ModelAndView();
		mv.addObject("scoList", list);
		mv.addObject("stu", stu);
		mv.setViewName("pages/score/index");
		return mv;
	}
	
	@RequestMapping("/toadd.action")
	public String toAdd(){
		return "pages/score/add";
	}
	
	@RequestMapping("/checkStuNo.action")
	public @ResponseBody String checkStuNo(HttpServletResponse response, String stuNo){
		Student stu = stuService.showByStuNo(stuNo);
		boolean flag = true;
		if(stu == null){
			flag = false;
		}else{
			Score score = scoService.showByStuId(stu.getStuId());
			if(score != null){
				flag = false;
			}
		}
	    JSONObject json = new JSONObject();
	    json.element("valid",flag);
	    return json.toString();
	}
	
	@RequestMapping("/checkStuName.action")
	public @ResponseBody String checkStuName(HttpServletResponse response, String stuNo, String stuName){
		Student student = new Student();
		student.setStuNo(stuNo);
		student.setStuName(stuName);
		Student stu = stuService.showByNoAndName(student);
		boolean flag = true;
		if(stu == null){
			flag = false;
		}
	    JSONObject json = new JSONObject();
	    json.element("valid",flag);
	    return json.toString();
	}
	
	@RequestMapping("/doadd.action")
	public void doAdd(HttpServletResponse response, Score score, int zgls, Student student) throws IOException{
		Student stu = stuService.showByNoAndName(student);
		if(stu != null){
			score.setStuId(stu.getStuId());
			score.setHistory(zgls);
			scoService.add(score);
		}
		response.sendRedirect("fuzzyQuery.action");
	}
	
	@RequestMapping("/dodelete.action")
	public void doDelete(HttpServletRequest request, HttpServletResponse response, int id) throws IOException{
		scoService.delete(id);
		response.sendRedirect("fuzzyQuery.action");
	}
	
}

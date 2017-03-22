package school.binjiang.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.sf.json.JSONObject;
import school.binjiang.po.PageBean;
import school.binjiang.po.Student;
import school.binjiang.service.StudentService;

@Controller
@RequestMapping("/student")
public class StudentController {
	
	@Autowired
	private StudentService stuService;
	
	
	@RequestMapping("/showall.action")
	public ModelAndView showAll(PageBean page){
		ModelAndView mv  = new ModelAndView();
		List<Student> stuList = stuService.showByNoNameGenderMajor(page);
		mv.addObject("stuList", stuList);
		mv.setViewName("pages/student/index");
		return mv;
	}
	
	@RequestMapping("/dodelete.action")
	public void doDelete(HttpServletRequest request, HttpServletResponse response, int id) throws IOException{
		stuService.delete(id);
		response.sendRedirect("showall.action");
	}
	
	@RequestMapping("/fuzzyQuery.action")
	public ModelAndView fuzzyQuery(HttpServletResponse response,Student student){
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("stuNo", student.getStuNo());
		map.put("stuName", student.getStuName());
		map.put("gender", student.getGender());
		map.put("major", student.getMajor());
		PageBean page = new PageBean();
		page.setParams(map);
		List<Student> stuList = stuService.showByNoNameGenderMajor(page);
		ModelAndView mv  = new ModelAndView();
		mv.addObject("stu", student);
		mv.addObject("stuList", stuList);
		mv.setViewName("pages/student/index");
		return mv;
	}
	
	@RequestMapping("/toadd.action")
	public String toAdd(){
		return "pages/student/add";
	}
	
	@RequestMapping("/doadd.action")
	public void doAdd(HttpServletResponse response, Student student) throws IOException{
		stuService.add(student);
		response.sendRedirect("showall.action");
	}
	
	@RequestMapping("/checkStuNo.action")
	public @ResponseBody String checkStuNo(HttpServletResponse response, String stuNo){
		Student stu = stuService.showByStuNo(stuNo);
		boolean flag = true;
		if(stu != null){
			flag = false;
		}
	    JSONObject json = new JSONObject();
	    json.element("valid",flag);
	    return json.toString();
	}
	
	@RequestMapping("/toupdate.action")
	public ModelAndView toUpdate(HttpServletRequest request, HttpServletResponse response, @RequestParam("html") int id){
		Student stu = stuService.showById(id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("stu", stu);
		mv.setViewName("pages/student/update");
		return mv;
	}
	
	@RequestMapping("/doupdate.action")
	public void doUpdate(HttpServletResponse response, Student student) throws IOException{
		stuService.update(student);
		response.sendRedirect("showall.action");
	}

}

package school.binjiang.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.sf.json.JSONObject;
import school.binjiang.po.PageBean;
import school.binjiang.po.Score;
import school.binjiang.po.Student;
import school.binjiang.service.ScoreService;
import school.binjiang.service.StudentService;
import school.binjiang.util.ExcelUtil;

@Controller
@RequestMapping("/score")
public class ScoreController {
	
	@Autowired
	private ScoreService scoService;
	@Autowired
	private StudentService stuService;
	//文件导出路径
	private static final String url = "C:\\Users\\Administrator\\Desktop";

	@RequestMapping("/fuzzyQuery")
	public ModelAndView fuzzyQuery(Student stu){
		List<Score> list = scoService.showByNoNameMajor(stu);
		ModelAndView mv = new ModelAndView();
		mv.addObject("scoList", list);
		mv.addObject("stu", stu);
		mv.setViewName("pages/score/index");
		return mv;
	}
	
	@RequestMapping("/toadd")
	public String toAdd(){
		return "pages/score/add";
	}
	
	@RequestMapping("/checkStuNo")
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
	
	@RequestMapping("/checkStuName")
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
	
	@RequestMapping("/doadd")
	public void doAdd(HttpServletResponse response, Score score, int zgls, Student student) throws IOException{
		Student stu = stuService.showByNoAndName(student);
		if(stu != null){
			score.setStuId(stu.getStuId());
			score.setHistory(zgls);
			scoService.add(score);
		}
		response.sendRedirect("fuzzyQuery.action");
	}
	
	@RequestMapping("/dodelete")
	public void doDelete(HttpServletRequest request, HttpServletResponse response, int id) throws IOException{
		scoService.delete(id);
		response.sendRedirect("fuzzyQuery.action");
	}
	
	@RequestMapping("/toupdate")
	public ModelAndView toUpdate(HttpServletRequest request, HttpServletResponse response, @RequestParam("html") int id){
		Student stu = stuService.showById(id);
		Score sco = scoService.showByStuId(stu.getStuId());
		ModelAndView mv = new ModelAndView();
		mv.addObject("sco", sco);
		mv.addObject("stu", stu);
		mv.setViewName("pages/score/update");
		return mv;
	}
	
	@RequestMapping("/doupdate")
	public void doUpdate(HttpServletResponse response, Score score, int zgls) throws IOException{
		score.setHistory(zgls);
		scoService.update(score);
		response.sendRedirect("fuzzyQuery.action");
	}
	
	@RequestMapping("/exportExcel")
	public void exportExcel(HttpServletResponse response,Student student) throws IOException{
		List<Score> scoList = scoService.showByNoNameMajor(student);
		String result = "";
		try {
			String[] secondTitles = {"学号", "姓名", "性别", "专业", "大学英语","高等数学","线性代数","计算机基础","毛泽东思想","邓小平理论","中国近现代史"};
			HSSFWorkbook workbook1 = ExcelUtil.makeExcelHead("学期成绩表", secondTitles.length-1);
			HSSFWorkbook workbook2 = ExcelUtil.makeSecondHead(workbook1, secondTitles);
			String[] beanProperty = {"stuNo","stuName","gender", "major", "english", "math", "xxds", "computer","mzd","dxp","history"};
			HSSFWorkbook workbook = ExcelUtil.exportExcelData(workbook2, scoList, beanProperty);
			FileOutputStream fos = new FileOutputStream(new File(url+"\\学期成绩表.xls"));
			workbook.write(fos);
			result = "success";
			fos.close();
		}  catch (IOException e) {
			result = "error";
			e.printStackTrace();
		} finally{
	    	 PrintWriter out = response.getWriter();
	    	 out.print(result);
	    	 out.flush();
	    	 out.close();
	     }
	}
}

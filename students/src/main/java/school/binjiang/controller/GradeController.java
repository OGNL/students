package school.binjiang.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
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
import school.binjiang.po.Grade;
import school.binjiang.po.Score;
import school.binjiang.po.Student;
import school.binjiang.service.GradeService;
import school.binjiang.service.StudentService;
import school.binjiang.util.ExcelUtil;

@Controller
@RequestMapping("/grade")
public class GradeController {
	
	@Autowired
	private GradeService gradeService;
	@Autowired
	private StudentService stuService;
	//文件导出路径
	private static final String url = "C:\\Users\\Administrator\\Desktop";
	
	@RequestMapping("/fuzzyQuery")
	public ModelAndView fuzzyQuery(Student stu){
		List<Grade> list = gradeService.showByNoNameGenderMajor(stu);
		ModelAndView mv = new ModelAndView();
		mv.addObject("graList", list);
		mv.addObject("stu", stu);
		mv.setViewName("pages/grade/index");
		return mv;
	}
	
	@RequestMapping("/toadd")
	public String toAdd(){
		return "pages/grade/add";
	}
	
	@RequestMapping("/checkStuNo")
	public @ResponseBody String checkStuNo(HttpServletResponse response, String stuNo){
		Student stu = stuService.showByStuNo(stuNo);
		boolean flag = true;
		if(stu == null){
			flag = false;
		}else{
			Grade grade = gradeService.showByStuId(stu.getStuId());
			if(grade != null){
				flag = false;
			}
		}
	    JSONObject json = new JSONObject();
	    json.element("valid",flag);
	    return json.toString();
	}
	
	@RequestMapping("/doadd")
	public void doAdd(HttpServletResponse response, Grade grade, Student student) throws IOException{
		Student stu = stuService.showByNoAndName(student);
		if(stu != null){
			grade.setStuId(stu.getStuId());
			if(grade.getCET4().equals("未通过")){
				grade.setCET6("未通过");
			}
			if(grade.getNCRE1().equals("未通过")){
				grade.setNCRE2("未通过");
			}
			gradeService.add(grade);
		}
	
		response.sendRedirect("fuzzyQuery.action");
	}
	
	@RequestMapping("/dodelete")
	public void doDelete(HttpServletRequest request, HttpServletResponse response, int id) throws IOException{
		gradeService.delete(id);
		response.sendRedirect("fuzzyQuery.action");
	}
	
	@RequestMapping("/toupdate")
	public ModelAndView toUpdate(HttpServletRequest request, HttpServletResponse response, @RequestParam("html") int id){
		Student stu = stuService.showById(id);
		Grade grade = gradeService.showByStuId(stu.getStuId());
		ModelAndView mv = new ModelAndView();
		mv.addObject("grade", grade);
		mv.addObject("stu", stu);
		mv.setViewName("pages/grade/update");
		return mv;
	}
	
	@RequestMapping("/doupdate")
	public void doUpdate(HttpServletResponse response, Grade grade) throws IOException{
		if(grade.getCET4().equals("未通过")){
			grade.setCET6("未通过");
		}
		if(grade.getNCRE1().equals("未通过")){
			grade.setNCRE2("未通过");
		}
		gradeService.update(grade);
		response.sendRedirect("fuzzyQuery.action");
	}
	
	@RequestMapping("/report")
	public String toReport(){
		return "pages/report/index_grade";
	}
	
	@RequestMapping("/exportExcel")
	public void exportExcel(HttpServletResponse response,Student student) throws IOException{
		List<Grade> gradeList = gradeService.showByNoNameGenderMajor(student);
		String result = "";
		try {
			String[] secondTitles = {"学号", "姓名", "性别", "专业", "英语四级","英语六级","计算机一级","计算机二级","会计从业资格证","教师资格证"};
			HSSFWorkbook workbook1 = ExcelUtil.makeExcelHead("等级考试情况表", secondTitles.length-1);
			HSSFWorkbook workbook2 = ExcelUtil.makeSecondHead(workbook1, secondTitles);
			String[] beanProperty = {"stuNo","stuName","gender", "major", "CET4", "CET6", "NCRE1", "NCRE2","account","teacher"};
			HSSFWorkbook workbook = ExcelUtil.exportExcelData(workbook2, gradeList, beanProperty);
			FileOutputStream fos = new FileOutputStream(new File(url+"\\等级考试情况表.xls"));
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

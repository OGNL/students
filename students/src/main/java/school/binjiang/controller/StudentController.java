package school.binjiang.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import school.binjiang.po.PageBean;
import school.binjiang.po.Student;
import school.binjiang.service.StudentService;
import school.binjiang.util.ExcelUtil;
import school.binjiang.vo.StudentVo;

@Controller
@RequestMapping("/student")
public class StudentController {
	
	@Autowired
	private StudentService stuService;

	private Gson gson = new Gson();
	private static final int count = 10;
	//文件导出路径
	private static final String url = "C:\\Users\\Administrator\\Desktop";
	
	
	@RequestMapping("/showall")
	public ModelAndView showAll(PageBean page){
		ModelAndView mv  = new ModelAndView();
		List<Student> stuList = stuService.showByNoNameGenderMajor(page);
		mv.addObject("stuList", stuList);
		mv.setViewName("pages/student/index");
		return mv;
	}
	
	@RequestMapping("/dodelete")
	public void doDelete(HttpServletRequest request, HttpServletResponse response, int id) throws IOException{
		stuService.delete(id);
		response.sendRedirect("showall.action");
	}
	
	@RequestMapping("/fuzzyQuery")
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
	
	@RequestMapping("/toadd")
	public String toAdd(){
		return "pages/student/add";
	}
	
	@RequestMapping("/doadd")
	public void doAdd(HttpServletResponse response, Student student) throws IOException{
		stuService.add(student);
		response.sendRedirect("showall.action");
	}
	
	@RequestMapping("/checkStuNo")
	public @ResponseBody String checkStuNo(HttpServletResponse response, String stuNo){
		Student stu = stuService.showByStuNo(stuNo);
		boolean flag = true;
		if(stu != null){
			flag = false;
		}
		JsonObject json = new JsonObject();
		json.addProperty("valid",flag);
	    return json.toString();
	}
	
	@RequestMapping("/toupdate")
	public ModelAndView toUpdate(HttpServletRequest request, HttpServletResponse response, @RequestParam("html") int id){
		Student stu = stuService.showById(id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("stu", stu);
		mv.setViewName("pages/student/update");
		return mv;
	}
	
	@RequestMapping("/doupdate")
	public void doUpdate(HttpServletResponse response, Student student) throws IOException{
		stuService.update(student);
		response.sendRedirect("showall.action");
	}
	
	@RequestMapping("/report")
	public String toReport(){
		return "pages/report/index";
	}
	
	@RequestMapping("/queryWordText")
	public void queryWordText(HttpServletResponse response,String year) throws IOException{
		String startDate = year+"-01-01";
		String endDate = year+"-12-31";
		StudentVo sv = new StudentVo();
		sv.setStartDate(startDate);
		sv.setEndDate(endDate);
		List<StudentVo> list = stuService.showNumByGender(sv);
		String jsonStr = gson.toJson(list);
		PrintWriter out = response.getWriter();
		out.print(jsonStr);
		out.flush();
		out.close();
	}
	
	@RequestMapping("/chart1")
	public void chart1(HttpServletResponse response,String year) throws IOException{
		String startDate = year+"-01-01";
		String endDate = year+"-12-31";
		StudentVo sv = new StudentVo();
		sv.setStartDate(startDate);
		sv.setEndDate(endDate);
		List<StudentVo> list = stuService.showNumByMajor(sv);
		String jsonStr = gson.toJson(list);
		PrintWriter out = response.getWriter();
		out.print(jsonStr);
		out.flush();
		out.close();
	}
	
	@RequestMapping("/chart2")
	public void chart2(HttpServletResponse response,String year) throws IOException{
		String startDate = year+"-01-01";
		String endDate = year+"-12-31";
		StudentVo sv = new StudentVo();
		sv.setStartDate(startDate);
		sv.setEndDate(endDate);
		List<StudentVo> list = stuService.showNumByAddress(sv);
		List<StudentVo> result = new ArrayList<StudentVo>();
		int rsTotal = 0;
		for(int i=0; i<list.size(); i++){
			rsTotal += list.get(i).getRs();
		}
		for(int i=0; i<list.size()&&i<count; i++){
			result.add(list.get(i));
			rsTotal -=list.get(i).getRs();
		}
		if(rsTotal >0){
			StudentVo stuVo = new StudentVo();
			stuVo.setAddress("其他");
			stuVo.setRs(rsTotal);
			result.add(stuVo);
		}
		String jsonStr = gson.toJson(list);
		PrintWriter out = response.getWriter();
		out.print(jsonStr);
		out.flush();
		out.close();
	}
	
	@RequestMapping("/exportExcel")
	public void exportExcel(HttpServletResponse response,Student student) throws IOException{
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("stuNo", student.getStuNo());
		map.put("stuName", student.getStuName());
		map.put("gender", student.getGender());
		map.put("major", student.getMajor());
		PageBean page = new PageBean();
		page.setParams(map);
		List<Student> stuList = stuService.showByNoNameGenderMajor(page);
		String result = "";
		try {
			String[] secondTitles = {"学号", "姓名", "性别", "专业", "出生日期","入学时间","联系方式","籍贯"};
			HSSFWorkbook workbook1 = ExcelUtil.makeExcelHead("学生信息表", secondTitles.length-1);
			HSSFWorkbook workbook2 = ExcelUtil.makeSecondHead(workbook1, secondTitles);
			String[] beanProperty = {"stuNo","stuName","gender", "major", "birthday", "enterTime", "phone", "address"};
			HSSFWorkbook workbook = ExcelUtil.exportExcelData(workbook2, stuList, beanProperty);
			FileOutputStream fos = new FileOutputStream(new File(url+"\\学生信息表.xls"));
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

package school.binjiang.controller;

import com.google.gson.JsonObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import school.binjiang.po.User;
import school.binjiang.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/login")
	public String login(){
		return "pages/login";
	}
	
	@RequestMapping("/verify")
	public void verifyNameAndPwd(HttpServletResponse response, HttpSession session, User user) throws IOException{
			User u = userService.showByName(user.getUsername());
			String msg = "";
			if(u != null){
				if(u.getPassword().equals(user.getPassword())){
					session.setAttribute("user", u);
					msg = "success";
				}else{
					msg = "error";
				}
			}else{
				msg = "error";
			}
			
			PrintWriter out = response.getWriter();
			out.print(msg);
			out.flush();
			out.close();
	}
	
	@RequestMapping("/dologin")
	public ModelAndView doLogin(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("pages/index");
		return mv;
	}
	
	@RequestMapping("/exit")
	public String exit(HttpSession session){
		session.removeAttribute("user");
		return "redirect: login.action";
	}
	
	@RequestMapping("/toupdate")
	public String toUpdate(){
		return "pages/user/updatePwd";
	}
	
	@RequestMapping("/checkPwd")
	public @ResponseBody String checkPwd(String username, String pwd1){
		User user = userService.showByName(username);
		boolean flag = true;
		if(!pwd1.equals(user.getPassword())){
			flag = false;
		}
		JsonObject json = new JsonObject();
		json.addProperty("valid",flag);
	    return json.toString();
	}
	
	@RequestMapping("/doupdate")
	public void doUpdate(HttpServletResponse response, User user, String pwd2) throws IOException{
		user.setPassword(pwd2);
		userService.updatePwd(user);
		response.sendRedirect("login.action");
		
	}
	
	@RequestMapping("/fuzzyQuery")
	public ModelAndView fuzzyQuery(User u,HttpSession session){
		User user = (User) session.getAttribute("user");
		List<User> list = userService.showByNameRole(u);
		ModelAndView mv = new ModelAndView();
		mv.addObject("userList", list);
		mv.addObject("user", user);
		mv.addObject("u", u);
		mv.setViewName("pages/user/index");
		return mv;
	}
	
	@RequestMapping("/toadd")
	public String toAdd(){
		return "pages/user/add";
	}
	
	@RequestMapping("/checkName")
	public @ResponseBody String checkName(HttpServletResponse response, String username){
		User user = userService.showByName(username);
		boolean flag = true;
		if(user != null){
			flag = false;
		}
		JsonObject json = new JsonObject();
		json.addProperty("valid",flag);
	    return json.toString();
	}
	
	@RequestMapping("/doadd")
	public void doAdd(HttpServletResponse response, User user) throws IOException{
		userService.add(user);
		response.sendRedirect("fuzzyQuery.action");
	}
	
	@RequestMapping("/dodelete")
	public void doDelete(HttpServletRequest request, HttpServletResponse response, int id) throws IOException{
		userService.delete(id);
		response.sendRedirect("fuzzyQuery.action");
	}
	
	@RequestMapping("/toUpdateUser")
	public ModelAndView toUpdateUser(@RequestParam("html") int id){
		User user = userService.showById(id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("u", user);
		mv.setViewName("pages/user/update");
		return mv;
	}
	
	@RequestMapping("/doUpdateUser")
	public void doUpdateUser(HttpServletResponse response, User user) throws IOException{
		userService.updatePwdAndRole(user);
		response.sendRedirect("fuzzyQuery.action");
	}
	

}

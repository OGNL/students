package school.binjiang.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import school.binjiang.po.User;
import school.binjiang.service.UserService;

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
					session.setAttribute("user", user);
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

}

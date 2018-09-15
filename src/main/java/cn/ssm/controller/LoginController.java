package cn.ssm.controller;



import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import cn.ssm.po.User;
import cn.ssm.service.ManagerService;
import cn.ssm.service.UserService;




@Controller
public class LoginController {
	
	@Autowired
	private ManagerService managerService;
	
	@Autowired
	private UserService userService;

	// 登陆
	@RequestMapping("/Login1")
	public String Login1(String userno, String password){

		int i = managerService.selectByNoAndPassword(userno, password);
	
			return "index";
		

	}
	
	@RequestMapping("Login")
	public @ResponseBody Integer Login(HttpSession session, String userno, String password){
		int i = managerService.selectByNoAndPassword(userno, password);
		System.out.println("--------------------------"+i);
		System.out.println("--------------------------"+password);
		if(i==1)
			session.setAttribute("manager", userno);
		return i;
	}
	
	
	@RequestMapping("/userLogin")
	public @ResponseBody Integer userLogin(HttpSession session, User user){
		user.setPassword(DigestUtils.md5DigestAsHex(user.getPassword().getBytes()));
		int i = managerService.selectByUsernameAndPassword(user);
		if(i==1){
			User u = userService.selectUserByUid(user.getUid());
			session.setAttribute("user", u);
		}
		return i;
	}
	@RequestMapping("/managerName")
	public @ResponseBody String  managerName(HttpSession session){
		String manager=(String) session.getAttribute("manager");

		return manager;
	}
	
	@RequestMapping("/userName")
	public @ResponseBody User userName(HttpSession session){
		User user=(User)session.getAttribute("user");
		return user;
	}
	@RequestMapping("/userNameExist")
	public @ResponseBody Integer userNameExist(HttpSession session){
		User user=(User)session.getAttribute("user");
		if(user==null)
			return 0;
		else 
			return 1;
	}
}

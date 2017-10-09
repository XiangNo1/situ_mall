package com.situ.mall.controller.front;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.situ.mall.pojo.User;
import com.situ.mall.service.IUserService;

@Controller
@RequestMapping(value="/login")
public class LoginController {
	
	@Autowired
	public IUserService userService;
	
	@RequestMapping(value="/newUser")
	public String newUser(User user, Model model){
		userService.addUser(user);
		model.addAttribute("user", user.getUsername());
		model.addAttribute("password", user.getPassword());
		return "redirect:/login/loginIn.shtml";
	}
	
	@RequestMapping(value="/loginOut")
	public String loginOut(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.removeAttribute("userSession");
		return "redirect:/index/index.shtml";
	}
	
	@RequestMapping(value="/loginIn")
	public String loginIn(String user, String password, HttpServletRequest request ){
		User u = null; 
		u = userService.findUserByUser(user);
		if (u == null) {
			return "redirect:/login/login.shtml";
		}
		else if(!u.getPassword().equals(password)){
			return "redirect:/login/login.shtml";
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("userSession", u);
			return "redirect:/index/index.shtml";
		}
	}
	
	@RequestMapping(value="/login")
	public String login(){
		return "login";
	}

	@RequestMapping(value="/register")
	public String register(){
		return "register";
	}
}

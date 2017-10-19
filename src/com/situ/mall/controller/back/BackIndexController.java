package com.situ.mall.controller.back;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.situ.mall.pojo.User;
import com.situ.mall.service.IUserService;

@Controller
@RequestMapping(value="/backIndex")
public class BackIndexController {

	@Autowired
	private IUserService userService;
	@RequestMapping(value="/index_v1")
	public String index_v1(){
		return "index_v1";
	}
	
	@RequestMapping(value="/backLoginOut")
	public String backLoginOut(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.removeAttribute("userBackSession");
		return "redirect:/backIndex/backLogin.action";
	}
	
	@RequestMapping(value="/backLogin2")
	public String login(String name, String password, String checkCode, HttpServletRequest request){
		String checkCodeSession = (String) request.getSession().getAttribute("checkCodeSession");
		if (checkCode == null || checkCode.equals("")) {
			return "redirect:/backIndex/backLogin.action";
		}
		if (!checkCode.equalsIgnoreCase(checkCodeSession)) {
			return "redirect:/backIndex/backLogin.action";
		}
		User user = userService.findUserByUser(name);
		if (name.equals(user.getUsername()) && password.equals(user.getPassword())) {
			HttpSession session = request.getSession();
			session.setAttribute("userBackSession", user);
			return "redirect:/backIndex/backIndex.action";
		}else {
			return "redirect:/backIndex/backLogin.action";
		}
		
	}
	
	@RequestMapping(value="/backLogin")
	public String backIndex2() {
		return "login2";
	}
	@RequestMapping(value="/backIndex")
	public String backIndex(){
		return "index";
	}
}

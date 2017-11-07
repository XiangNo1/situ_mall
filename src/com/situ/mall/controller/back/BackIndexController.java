package com.situ.mall.controller.back;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.omg.PortableInterceptor.USER_EXCEPTION;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.mall.common.ServerResponse;
import com.situ.mall.pojo.User;
import com.situ.mall.service.IUserService;

@Controller
@RequestMapping(value="/backIndex")
public class BackIndexController {

	@Autowired
	private IUserService userService;
	
	@RequestMapping(value="/backRegister2")
	@ResponseBody
	public ServerResponse backRegister2(User user) {
		boolean flag = userService.addUser(user);
		if (flag) {
			return ServerResponse.createSuccess("注册成功");
		} else {
			return ServerResponse.createError("注册失败");
		}
	}
	
	@RequestMapping(value="/backRegister")
	public String backRegister(){
		return "backRegister";
	}
	
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
	@ResponseBody
	public ServerResponse login(String name, String password, String checkCode, HttpServletRequest request){
		try {
			String checkCodeSession = (String) request.getSession().getAttribute("checkCodeSession");
			if (checkCode == null || checkCode.equals("")) {
				return ServerResponse.createError("登录失败");
			}
			if (!checkCode.equalsIgnoreCase(checkCodeSession)) {
				return ServerResponse.createError("登录失败");
			}
			User user = userService.findUserByUser(name);
			if (name.equals(user.getUsername()) && password.equals(user.getPassword())) {
				HttpSession session = request.getSession();
				session.setAttribute("userBackSession", user);
				return ServerResponse.createSuccess("登录成功");
			}else {
				return ServerResponse.createError("登录失败");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			return ServerResponse.createError("登录失败");
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

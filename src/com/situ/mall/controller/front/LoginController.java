package com.situ.mall.controller.front;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/login")
public class LoginController {
	
	@RequestMapping(value="/login")
	public String login(){
		return "login";
	}

	@RequestMapping(value="/register")
	public String register(){
		return "register";
	}
}

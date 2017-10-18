package com.situ.mall.controller.back;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/backIndex")
public class BackIndexController {

	@RequestMapping(value="/index_v1")
	public String index_v1(){
		return "index_v1";
	}
	
	@RequestMapping(value="/backIndex")
	public String backIndex(){
		return "index";
	}
}

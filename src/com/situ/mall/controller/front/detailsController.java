package com.situ.mall.controller.front;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/details")
public class detailsController {

	@RequestMapping(value="/details")
	public String details(){
		return "details";
	}
}

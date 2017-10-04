package com.situ.mall.controller.front;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/cart")
public class CartController {

	@RequestMapping(value="/cart")
	public String cart(){
		return "cart";
	}
}

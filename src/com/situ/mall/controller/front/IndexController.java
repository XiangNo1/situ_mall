package com.situ.mall.controller.front;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.situ.mall.pojo.Slideshow;
import com.situ.mall.service.ISlideshowService;

@Controller
public class IndexController {
	
	@Autowired
	private ISlideshowService slideshowService;
	
	@RequestMapping("/index.shtml")
	public String index(Model model) {
		List<Slideshow> list = slideshowService.findSlideshowOnstatus();
		model.addAttribute("list", list);
		return "index";
	}

	// 商品身体
	/*@RequestMapping(value = "/list.shtml")
	public String productMain() {

		
	}*/

}
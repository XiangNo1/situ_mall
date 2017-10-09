package com.situ.mall.controller.front;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.situ.mall.pojo.Category;
import com.situ.mall.pojo.Slideshow;
import com.situ.mall.service.ICategoryService;
import com.situ.mall.service.ISlideshowService;

@Controller
@RequestMapping(value="/index")
public class Index2Controller {
	
	@Autowired
	private ISlideshowService slideshowService;
	@Autowired
	private ICategoryService categoryService;
	
	@RequestMapping("/index")
	public String index(Model model) {
		List<Slideshow> slideshows = slideshowService.findSlideshowOnstatus();
		List<Category> categories = categoryService.findCategory();
		System.out.println(categories);
		model.addAttribute("categories", categories);
		model.addAttribute("slideshows", slideshows);
		return "index";
	}

	// 商品身体
	/*@RequestMapping(value = "/list.shtml")
	public String productMain() {

		
	}*/

}
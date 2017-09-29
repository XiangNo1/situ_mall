package com.situ.mall.controller.back;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.situ.mall.pojo.Slideshow;
import com.situ.mall.service.ISlideshowService;

@Controller
@RequestMapping(value="/slideshow")
public class SlideshowController {

	@Autowired
	private ISlideshowService slideshowService;
	
	@RequestMapping(value="/findSlideshow")
	public String findSlideshow(Model model){
		List<Slideshow> list = slideshowService.findSlideshow();
		model.addAttribute("list", list);
		return "findSlideshow";
	}
}

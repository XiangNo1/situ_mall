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
	
	@RequestMapping(value="/updateSlideshow2")
	public String updateSlideshow2(Slideshow slideshow){
		System.out.println(slideshow);
		slideshowService.updateSlideshow(slideshow);
		return "redirect:/slideshow/findSlideshow.action";
	}
	
	@RequestMapping(value="/updateSlideshow")
	public String updateSlideshow(Integer id, Model model){
		Slideshow slideshow = slideshowService.findSlideshowById(id);
		model.addAttribute("slideshow", slideshow);
		return "updateSlideshow";
	}
	
	@RequestMapping(value="/deleteSlideshow")
	public String deleteSlideshow(Integer id){
		slideshowService.deleteSlideshow(id);
		return "redirect:/slideshow/findSlideshow.action";
	}
	
	@RequestMapping(value="/addSlideshow2")
	public String addSlideshow2(Slideshow slideshow){
		slideshowService.addSlideshow(slideshow);
		return "redirect:/slideshow/findSlideshow.action";
	}
	
	@RequestMapping(value="/addSlideshow")
	public String addSlideshow(){
		return "addSlideshow";
	}
	
	@RequestMapping(value="/updateSlideshowStatus")
	public String updateSlideshowStatus(Slideshow slideshow){
		slideshowService.updateSlideshowStatus(slideshow);
		return "redirect:/slideshow/findSlideshow.action";
	}
	
	@RequestMapping(value="/findSlideshow")
	public String findSlideshow(Model model){
		List<Slideshow> list = slideshowService.findSlideshow();
		model.addAttribute("list", list);
		return "findSlideshow";
	}
}

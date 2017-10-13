package com.situ.mall.controller.back;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.situ.mall.pojo.Shipping;
import com.situ.mall.service.IShippingService;
import com.situ.mall.vo.PageBean;

@Controller
@RequestMapping(value="/shipping")
public class ShappingController {

	@Autowired
	private IShippingService shippingService;
	
	@RequestMapping(value="/updateShipping2")
	public String updateShipping2(Shipping shipping){
		shippingService.updateShipping(shipping);
		return "redirect:/shipping/findShipping.action";
		
	}
	
	@RequestMapping(value="/updateShipping")
	public String updateShipping(Integer id,Model model){
		Shipping shipping = shippingService.findShippingById(id);
		model.addAttribute("shipping", shipping);
		return "updateShipping";
	}
	
	@RequestMapping(value="/deleteShipping")
	public String deleteShipping(Integer id){
		shippingService.deleteShippingByid(id);
		return "redirect:/shipping/findShipping.action";
	}
	
	@RequestMapping(value="/addShipping2")
	public String addShipping2(Shipping shipping){
		shippingService.addShipping(shipping);
		return "redirect:/shipping/findShipping.action";
	}
	
	@RequestMapping(value="/addShipping")
	public String addShipping(){
		return "addShipping";
	}
	
	@RequestMapping(value="/findShipping")
	public ModelAndView findShipping(String pageIndex, String pageSize,ModelAndView modelAndView) {
		int pageIndex1 = 1;
		if (pageIndex!= null && !pageIndex.equals("")) {
			pageIndex1 = Integer.parseInt(pageIndex);
		}
		int pageSize1 = 3;
		if (pageSize != null && !pageSize.equals("")) {
			pageSize1 = Integer.parseInt(pageSize);
		}
		PageBean pageBean = shippingService.getPageBeanShipping(pageIndex1,pageSize1);
		System.out.println(pageBean);
		modelAndView.addObject("pageBean", pageBean);
		modelAndView.setViewName("findShipping");
		return modelAndView;
	}
}

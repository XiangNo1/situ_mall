package com.situ.mall.controller.back;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.situ.mall.service.IOrderService;
import com.situ.mall.vo.PageBean;

@Controller
@RequestMapping(value="/backOrder")
public class BackOrderController {

	@Autowired
	private IOrderService orderService;
	
	@RequestMapping(value="/findBackOrder")
	public ModelAndView findBackOrder(String pageIndex, String pageSize,ModelAndView modelAndView) {
		int pageIndex1 = 1;
		if (pageIndex!= null && !pageIndex.equals("")) {
			pageIndex1 = Integer.parseInt(pageIndex);
		}
		int pageSize1 = 3;
		if (pageSize != null && !pageSize.equals("")) {
			pageSize1 = Integer.parseInt(pageSize);
		}
		PageBean pageBean = orderService.getPageBeanBackOrder(pageIndex1,pageSize1);
		System.out.println(pageBean);
		modelAndView.addObject("pageBean", pageBean);
		modelAndView.setViewName("findBackOrder");
		return modelAndView;
	}
}

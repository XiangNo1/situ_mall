package com.situ.mall.controller.back;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.situ.mall.pojo.Category;
import com.situ.mall.service.ICategoryService;
import com.situ.mall.vo.PageBean;

@Controller
@RequestMapping(value="/category")
public class CategoryController {

	@Autowired
	private ICategoryService categoryService;
	
	@RequestMapping(value="/findAllCategory")
	public ModelAndView findAllCategory(String pageIndex, String pageSize,ModelAndView modelAndView) {
		int pageIndex1 = 1;
		if (pageIndex!= null && !pageIndex.equals("")) {
			pageIndex1 = Integer.parseInt(pageIndex);
		}
		int pageSize1 = 5;
		if (pageSize != null && !pageSize.equals("")) {
			pageSize1 = Integer.parseInt(pageSize);
		}
		PageBean pageBean = categoryService.getPageBeancategory(pageIndex1,pageSize1);
		System.out.println(pageBean);
		modelAndView.addObject("pageBean", pageBean);
		modelAndView.setViewName("findCategory");
		return modelAndView;
	}
}

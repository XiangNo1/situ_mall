package com.situ.mall.controller.back;

import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JsonFormat.Value;
import com.situ.mall.pojo.Category;
import com.situ.mall.service.ICategoryService;
import com.situ.mall.vo.PageBean;

@Controller
@RequestMapping(value="/category")
public class CategoryController {

	@Autowired
	private ICategoryService categoryService;
	
	
	@RequestMapping(value="updateCategory2")
	public String updateCategory2(Category category){
		categoryService.updateCategory(category);
		return "redirect:/category/findAllCategory.action";
	}
	
	@RequestMapping(value="updateCategory")
	public ModelAndView updateCategory(Integer id, ModelAndView modelAndView){
		Category category = categoryService.findCategoryById(id);
		System.out.println(category);
		modelAndView.addObject("category", category);
		modelAndView.setViewName("updateCategory");
		return modelAndView;
	}
	
	@RequestMapping(value="deleteCategory")
	public String deleteCategory(Integer id){
		categoryService.deleteCategoryById(id);
		return "redirect:/category/findAllCategory.action";
		
	}
	
	@RequestMapping(value="/addCategory2")
	public String addCategory2(Category category){
		categoryService.addCategory(category);
		return "redirect:/category/findAllCategory.action";
	}
	
	@RequestMapping(value="/addCategory")
	public String addCategory(){
		return "addCategory";
	}
	
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

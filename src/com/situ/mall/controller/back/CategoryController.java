package com.situ.mall.controller.back;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.situ.mall.common.ServerResponse;
import com.situ.mall.pojo.Category;
import com.situ.mall.service.ICategoryService;
import com.situ.mall.vo.PageBean;

@Controller
@RequestMapping(value="/category")
public class CategoryController {

	@Autowired
	private ICategoryService categoryService;
	
	
	@RequestMapping(value="updateCategory2")
	@ResponseBody
	public ServerResponse updateCategory2(Category category){
		return categoryService.updateCategory(category);
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
	@ResponseBody
	public ServerResponse deleteCategory(Integer id){
		return categoryService.deleteCategoryById(id);
		
	}
	
	@RequestMapping(value="/addCategory2")
	@ResponseBody
	public ServerResponse addCategory2(Category category){
		return categoryService.addCategory(category);
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

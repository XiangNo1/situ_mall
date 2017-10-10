package com.situ.mall.controller.front;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.situ.mall.pojo.Category;
import com.situ.mall.pojo.Product;
import com.situ.mall.service.ICategoryService;
import com.situ.mall.service.IProductService;
import com.situ.mall.vo.PageBean;

@Controller
@RequestMapping(value="/details")
public class detailsController {

	
	@Autowired
	private IProductService productService;
	@Autowired
	private ICategoryService categoryService;
	
	@RequestMapping(value="/details1")
	public ModelAndView findAllCategory(Integer id, String pageIndex, String pageSize,ModelAndView modelAndView) {
		int pageIndex1 = 1;
		if (pageIndex!= null && !pageIndex.equals("")) {
			pageIndex1 = Integer.parseInt(pageIndex);
		}
		int pageSize1 = 3;
		if (pageSize != null && !pageSize.equals("")) {
			pageSize1 = Integer.parseInt(pageSize);
		}
		PageBean pageBean = productService.getPageBeanproductByid(pageIndex1,pageSize1, id);
		System.out.println(pageBean);
		List<Category> categories = categoryService.findCategory();
		System.out.println(categories);
		Category category = categoryService.findCategoryById(id);
		modelAndView.addObject("categories", categories);
		modelAndView.addObject("category", category);
		modelAndView.addObject("pageBean", pageBean);
		modelAndView.addObject("id", id);
		modelAndView.setViewName("goodsList");
		return modelAndView;
	}
	
	
	@RequestMapping(value="/details2")
	public String details2(Integer id, Model model){
		Product product = productService.findProductById(id);
		String[] img = product.getSub_images().split(",");
		model.addAttribute("img", img);
		model.addAttribute("product", product);
		return "details2";
	}
}

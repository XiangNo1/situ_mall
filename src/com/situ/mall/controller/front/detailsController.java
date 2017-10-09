package com.situ.mall.controller.front;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.situ.mall.pojo.Category;
import com.situ.mall.pojo.Product;
import com.situ.mall.service.IProductService;

@Controller
@RequestMapping(value="/details")
public class detailsController {

	
	@Autowired
	private IProductService productService;
	@RequestMapping(value="/details1")
	public String details1(Category category, Model model){
		List<Product> list = productService.findProductByCategoryId(category.getId());
		System.out.println(list);
		model.addAttribute("products", list);
		return "goodsList";
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

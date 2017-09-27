package com.situ.mall.controller.back;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.situ.mall.pojo.Product;
import com.situ.mall.service.IProductService;
import com.situ.mall.vo.PageBean;

@Controller
@RequestMapping(value="/product")
public class ProductController {

	@Autowired
	private IProductService productservice;
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Date.class, new CustomDateEditor(
                new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"), true));
        binder.registerCustomEditor(Date.class, new CustomDateEditor(
                new SimpleDateFormat("yyyy-MM-dd"), true));
    }
	
	@RequestMapping(value="updateProduct2")
	public String updateProduct2(Product product){
		productservice.updateProduct(product);
		return "redirect:/product/findAllProduct.action";
	}
	
	@RequestMapping(value="updateProduct")
	public String updateProduct(Integer id, Model model){
		Product product = productservice.findProductById(id);
		model.addAttribute("product", product);
		return "updateProduct";
	}
	
	@RequestMapping(value="deleteProduct")
	public String deleteProduct(Integer id){
		productservice.deleteProductById(id);
		return "redirect:/product/findAllProduct.action";
	}
	
	@RequestMapping(value="/addProduct2")
	public String addProduct2(Product product){
		productservice.addProduct(product);
		return "redirect:/product/findAllProduct.action";
	}
	
	@RequestMapping(value="/addProduct")
	public String addProduct(){
		return "addProduct";
	}
	
	@RequestMapping(value="/findAllProduct")
	public ModelAndView list(String pageIndex, String pageSize,ModelAndView modelAndView) {
		int pageIndex1 = 1;
		if (pageIndex!= null && !pageIndex.equals("")) {
			pageIndex1 = Integer.parseInt(pageIndex);
		}
		int pageSize1 = 3;
		if (pageSize != null && !pageSize.equals("")) {
			pageSize1 = Integer.parseInt(pageSize);
		}
		PageBean pageBean = productservice.getPageBeanproduct(pageIndex1,pageSize1);
		System.out.println(pageBean);
		modelAndView.addObject("pageBean", pageBean);
		modelAndView.setViewName("findProduct");
		return modelAndView;
	}
}

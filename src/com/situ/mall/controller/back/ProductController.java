package com.situ.mall.controller.back;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.situ.mall.common.ServerResponse;
import com.situ.mall.pojo.Category;
import com.situ.mall.pojo.Product;
import com.situ.mall.service.IProductService;
import com.situ.mall.vo.PageBean;
import com.situ.mall.vo.SearchProductByCondition;

@Controller
@RequestMapping(value="/product")
public class ProductController {

	@Autowired
	private IProductService productservice;
	
	@RequestMapping(value="/selectProvince")
	public @ResponseBody List<Category> selectProvinces(ModelAndView modelAndView){
		List<Category> list = productservice.selectFirst();
		for (Category category : list) {
			System.out.println(category);
		}
		modelAndView.addObject("province", list);
		
		return list;
	}
	
	@RequestMapping(value="/selectCitys")
	public @ResponseBody List<Category> selectProvinces(Integer id){
		List<Category> list = productservice.selectSecond(id);
		for (Category category : list) {
			System.out.println(category);
		}
		
		return list;
	}
	
	
	@RequestMapping(value="/deleteAllProduct")
	public String deleteAllProduct(Integer[] selectIds){
		if (selectIds == null || selectIds.length < 1) {
			return "redirect:/product/findAllProduct.action";
		}
		for (Integer id : selectIds) {
			productservice.deleteProductById(id);
		}
		return "redirect:/product/findAllProduct.action";
	}
	
	@RequestMapping(value="/upAllProduct")
	public String upAllProduct(Integer[] selectIds){
		if (selectIds == null || selectIds.length < 1) {
			return "redirect:/product/findAllProduct.action";
		}
		for (Integer id : selectIds) {
			productservice.upProductById(id);
		}
		return "redirect:/product/findAllProduct.action";
	}
	
	@RequestMapping(value="/downAllProduct")
	public String downAllProduct(Integer[] selectIds){
		if (selectIds == null || selectIds.length < 1) {
			return "redirect:/product/findAllProduct.action";
		}
		for (Integer id : selectIds) {
			productservice.downProductById(id);
		}
		return "redirect:/product/findAllProduct.action";
	}
	
	@RequestMapping(value="searchProductByCondition")
	public ModelAndView searchByCondition(ModelAndView modelAndView, String pageIndex,String pageSize, Integer category_id){
		
			int pageIndex1 = 1;
			if (pageIndex!= null && !pageIndex.equals("")) {
				pageIndex1 = Integer.parseInt(pageIndex);
			}
			int pageSize1 = 3;
			if (pageSize != null && !pageSize.equals("")) {
				pageSize1 = Integer.parseInt(pageSize);
			}
			SearchProductByCondition searchCondition = new SearchProductByCondition(pageIndex1, pageSize1);
			Product product = new Product();
			product.setCategory_id(category_id);
			searchCondition.setProduct(product);
			PageBean pageBean = productservice.getProductSearchPageBean(searchCondition);
			System.out.println(pageBean);
			System.out.println(searchCondition);
			modelAndView.addObject("searchCondition", searchCondition);
			modelAndView.addObject("pageBean", pageBean);
			modelAndView.setViewName("findProduct");
			return modelAndView;
	}
	
	@RequestMapping(value="updateStatusProduct")
	public String updateStatusProduct(Integer id, Integer status, String pageIndex, Model model){
		productservice.updateStatusProduct(id, status);
		model.addAttribute("pageIndex", pageIndex);
		return "redirect:/product/findAllProduct.action";
	}
	
	@RequestMapping(value="updateProduct2")
	@ResponseBody
	public ServerResponse updateProduct2(Product product){
		System.out.println(product);
		return productservice.updateProduct(product);
	}
	
	@RequestMapping(value="updateProduct")
	public String updateProduct(Integer id, Model model){
		Product product = productservice.findProductById(id);
		System.out.println(product);
		Category category2 = productservice.findCategoryById(product.getCategory_id());
		Category category1 = productservice.findCategoryById(category2.getParent_id());
		System.out.println(category1);
		System.out.println(category2);
		model.addAttribute("c1", category1);
		model.addAttribute("c2", category2);
		model.addAttribute("product", product);
		return "updateProduct";
	}
	
	@RequestMapping(value="deleteProduct")
	@ResponseBody
	public ServerResponse deleteProduct(Integer id){
		return productservice.deleteProductById(id);
	}
	
	@RequestMapping(value="/addProduct2")
	@ResponseBody
	public ServerResponse addProduct2(Product product){
		System.out.println(product);
		return productservice.addProduct(product);
		
	}
	
	@RequestMapping(value="/addProduct")
	public ModelAndView addProduct(ModelAndView modelAndView){
		
		modelAndView.setViewName("addProduct");
		return modelAndView;
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

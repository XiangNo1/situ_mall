package com.situ.mall.controller.back;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

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
	
	 @RequestMapping("/uploadPic")
	    @ResponseBody
	    public Map<String, Object> uploadPic(MultipartFile pictureFile) {
	       //为了防止重名生成随机的名字
	       String name = UUID.randomUUID().toString().replace("-", "");
	       //jpg,png
	       String ext = FilenameUtils.getExtension(pictureFile.getOriginalFilename());
	       String fileName = name + "." + ext;//数据库里面
	       String filePath = "F:\\pic\\" + fileName;
	       try {
	           pictureFile.transferTo(new File(filePath));
	       } catch (IllegalStateException | IOException e) {
	           e.printStackTrace();
	       }
	       Map<String, Object> map = new HashMap<String, Object>();
	       map.put("fileName", fileName);
	       return map;
	    }
	
	@RequestMapping(value="/deleteAllProduct")
	public String deleteAllProduct(Integer[] selectIds){
		for (Integer id : selectIds) {
			productservice.deleteProductById(id);
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
	public String updateStatusProduct(Integer id, Integer status){
		productservice.updateStatusProduct(id, status);
		return "redirect:/product/findAllProduct.action";
	}
	
	@RequestMapping(value="updateProduct2")
	public String updateProduct2(Product product){
		System.out.println(product);
		productservice.updateProduct(product);
		return "redirect:/product/findAllProduct.action";
	}
	
	@RequestMapping(value="updateProduct")
	public String updateProduct(Integer id, Model model){
		Product product = productservice.findProductById(id);
		System.out.println(product);
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
		System.out.println(product);
		productservice.addProduct(product);
		return "redirect:/product/findAllProduct.action";
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

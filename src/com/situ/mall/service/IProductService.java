package com.situ.mall.service;

import java.util.List;

import com.situ.mall.pojo.Category;
import com.situ.mall.pojo.Product;
import com.situ.mall.vo.PageBean;
import com.situ.mall.vo.SearchProductByCondition;

public interface IProductService {

	PageBean getPageBeanproduct(int pageIndex, int pageSize);

	void addProduct(Product product);

	void deleteProductById(Integer id);

	Product findProductById(Integer id);

	void updateProduct(Product product);

	boolean updateStatusProduct(Integer id, Integer status);

	PageBean getProductSearchPageBean(SearchProductByCondition searchCondition);

	List<Category> selectFirst();

	List<Category> selectSecond(Integer id);

	boolean upProductById(Integer id);

	boolean downProductById(Integer id);

	Category findCategoryById(Integer parent_id);

	List<Product> findProductByCategoryId(Integer parent_id);

	PageBean getPageBeanproductByid(int pageIndex1, int pageSize1, Integer id, String name);


}

package com.situ.mall.service;

import java.util.List;

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

}
package com.situ.mall.service;

import java.util.List;

import com.situ.mall.pojo.Category;
import com.situ.mall.vo.PageBean;

public interface ICategoryService {

	List<Category> findAllCategory();

	PageBean getPageBeancategory(int pageIndex, int pageSize);

	boolean addCategory(Category category);

	boolean deleteCategoryById(Integer id);

	Category findCategoryById(Integer id);

	boolean updateCategory(Category category);

	List<Category> findCategory();

}

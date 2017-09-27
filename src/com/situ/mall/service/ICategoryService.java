package com.situ.mall.service;

import java.util.List;

import com.situ.mall.pojo.Category;
import com.situ.mall.vo.PageBean;

public interface ICategoryService {

	List<Category> findAllCategory();

	PageBean getPageBeancategory(int pageIndex, int pageSize);

}

package com.situ.mall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mall.dao.CategoryDao;
import com.situ.mall.pojo.Category;
import com.situ.mall.pojo.Product;
import com.situ.mall.vo.PageBean;

@Service
public class CategoryServiceImpl implements ICategoryService {

	@Autowired
	private CategoryDao categoryDao;

	@Override
	public List<Category> findAllCategory() {
		return categoryDao.findAllCategory();
	}

	@Override
	public PageBean getPageBeancategory(int pageIndex, int pageSize) {
		PageBean<Category> pageBean = new PageBean<Category>();
		pageBean.setPageIndex(pageIndex);
		pageBean.setPageSize(pageSize);
		int totalCount = categoryDao.findTotalCountCategory();
		pageBean.setTotalCount(totalCount);
		int totalPage =(int) Math.ceil((double) totalCount / pageSize );
		pageBean.setTotalPage(totalPage);
		int index =( pageIndex - 1) * pageSize;
		List<Category> list = categoryDao.findCategoryBeanList(index, pageSize);
		pageBean.setList(list);
		return pageBean;
	}

	/*@Override
	public void addCategory(Category category) {
		// TODO Auto-generated method stub
		categoryDao.addCategory(category);
	}

	@Override
	public Category findCategoryById(Integer id) {
		// TODO Auto-generated method stub
		return categoryDao.findCategoryById(id);
	}

	@Override
	public void deleteCategoryById(Category category) {
		// TODO Auto-generated method stub
		categoryDao.deleteCategoryById(category);
	}*/
}

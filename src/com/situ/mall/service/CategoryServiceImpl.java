package com.situ.mall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mall.common.ServerResponse;
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

	@Override
	public ServerResponse addCategory(Category category) {
		// TODO Auto-generated method stub
		try {
			int i = categoryDao.addCategory(category);
			if (i > 0) {
				return ServerResponse.createSuccess("添加分类成功");
			} else {
				return ServerResponse.createError("添加分类失败");
			}
		} catch (Exception e) {
			return ServerResponse.createError("添加分类失败");
		}
	}

	@Override
	public Category findCategoryById(Integer id) {
		// TODO Auto-generated method stub
		return categoryDao.findCategoryById(id);
	}
	@Override
	public ServerResponse deleteCategoryById(Integer id) {
		// TODO Auto-generated method stub
		try {
			int i = categoryDao.deleteCategoryById(id);
			if (i > 0) {
				return ServerResponse.createSuccess("删除成功");
			} else {
				return ServerResponse.createError("删除失败");
			}
		} catch (Exception e) {
			return ServerResponse.createError("删除失败");
		}
	}

	@Override
	public ServerResponse updateCategory(Category category) {
		int i = categoryDao.updateCategory(category);
		try {
			if (i > 0) {
				return ServerResponse.createSuccess("修改成功");
			} else {
				return ServerResponse.createError("修改失败");
			}
		} catch (Exception e) {
			return ServerResponse.createError("修改失败");
		}
	}

	@Override
	public List<Category> findCategory() {
		// TODO Auto-generated method stub
		return categoryDao.findCategory();
	}
}

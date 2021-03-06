package com.situ.mall.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.situ.mall.pojo.Category;

public interface CategoryDao {

	List<Category> findAllCategory();

	int findTotalCountCategory();

	List<Category> findCategoryBeanList(@Param(value="index")int index, @Param(value="pageSize")int pageSize);

	int addCategory(Category category);

	int deleteCategoryById(Integer id);

	Category findCategoryById(Integer id);

	int updateCategory(Category category);

	List<Category> findCategory();

}

package com.situ.mall.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.context.annotation.Primary;

import com.situ.mall.pojo.Category;
import com.situ.mall.pojo.Product;
import com.situ.mall.vo.SearchProductByCondition;

public interface ProductDao {

	int findTotalCountProduct();

	List<Product> findProductBeanList(@Param(value="index")int index, @Param(value="pageSize")int pageSize);

	int addProduct(Product product);

	int deleteProductById(Integer id);

	Product findProductById(Integer id);

	int updateProduct(Product product);

	int updateStatusProduct(@Param(value="id")Integer id, @Param(value="status")Integer status);

	List<Product> findSearchProductBeanList(@Param(value="index")int index, @Param(value="searchCondition")SearchProductByCondition searchCondition);

	int findTotalCountSearchProduct(SearchProductByCondition searchCondition);

	List<Category> selectFirst();

	List<Category> selectSecond(Integer id);

	int upProductById(Integer id);

	int downProductById(Integer id);

	Category findCategoryById(Integer id);

	List<Product> findProductByCategoryId(Integer parent_id);

	List<Product> findProductBeanListByid(@Param(value="index")int index, @Param(value="pageSize")int pageSize, @Param(value="id")Integer id, @Param(value="name")String name);

	int findTotalCountProductByid(@Param(value="id")Integer id, @Param(value="name")String name);


}

package com.situ.mall.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.context.annotation.Primary;

import com.situ.mall.pojo.Product;

public interface ProductDao {

	int findTotalCountProduct();

	List<Product> findProductBeanList(@Param(value="index")int index, @Param(value="pageSize")int pageSize);

	void addProduct(Product product);

	void deleteProductById(Integer id);

	Product findProductById(Integer id);

	void updateProduct(Product product);

	int updateStatusProduct(@Param(value="id")Integer id, @Param(value="status")Integer status);


}

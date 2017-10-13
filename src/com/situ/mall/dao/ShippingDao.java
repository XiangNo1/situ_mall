package com.situ.mall.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.situ.mall.pojo.Category;
import com.situ.mall.pojo.Shipping;

public interface ShippingDao {

	List<Shipping> findShippingByUserId(Integer id);

	List<Shipping> findShipping();

	int findTotalCountShipping();

	List<Shipping> findShippingBeanList(@Param(value="index")int index, @Param(value="pageSize")int pageSize);

	int addShipping(Shipping shipping);

	int deleteShippingByid(Integer id);

	Shipping findShippingById(Integer id);

	int updateShipping(Shipping shipping);

}

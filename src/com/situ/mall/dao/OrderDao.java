package com.situ.mall.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.situ.mall.pojo.Order;

public interface OrderDao {

	int addOrder(Order order);

	int findTotalCountBackOrder();

	List<Order> findBackOrderBeanList(@Param(value="index")int index, @Param(value="pageSize")int pageSize);

	List<Order> findOrderByUser(Integer id);

	int findTotalCountOrder(Integer id);

	List<Order> findOrderBeanList(@Param(value="id")Integer id, @Param(value="index")int index, @Param(value="pageSize")int pageSize);

}

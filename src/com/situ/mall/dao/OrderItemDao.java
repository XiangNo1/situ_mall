package com.situ.mall.dao;

import java.util.List;

import com.situ.mall.pojo.OrderItem;

public interface OrderItemDao {

	int addOrderItem(OrderItem orderItem);

	List<OrderItem> findOrderItemByorder_no(Long order_no);

	List<OrderItem> findOrderItemByUser(Integer id);

}

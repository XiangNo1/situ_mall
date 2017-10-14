package com.situ.mall.service;

import java.util.List;

import com.situ.mall.pojo.OrderItem;

public interface IOrderItemService {

	boolean addOrderItem(OrderItem orderItem);

	List<OrderItem> findOrderItemByorder_no(Long order_no);

}

package com.situ.mall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mall.dao.OrderItemDao;
import com.situ.mall.pojo.OrderItem;

@Service
public class OrderItemService implements IOrderItemService{

	@Autowired
	private OrderItemDao orderItemDao;

	@Override
	public boolean addOrderItem(OrderItem orderItem) {
		// TODO Auto-generated method stub
		int i = orderItemDao.addOrderItem(orderItem);
		return i>0?true:false;
	}

	@Override
	public List<OrderItem> findOrderItemByorder_no(Long order_no) {
		// TODO Auto-generated method stub
		return orderItemDao.findOrderItemByorder_no(order_no);
	}
	
}

package com.situ.mall.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mall.dao.OrderDao;
import com.situ.mall.pojo.Order;

@Service
public class OrderService implements IOrderService{

	@Autowired
	private OrderDao orderDao;

	@Override
	public boolean addOrder(Order order) {
		// TODO Auto-generated method stub
		int i = orderDao.addOrder(order);
		return i>0?true:false;
	}
}

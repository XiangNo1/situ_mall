package com.situ.mall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mall.dao.OrderDao;
import com.situ.mall.pojo.Category;
import com.situ.mall.pojo.Order;
import com.situ.mall.vo.PageBean;

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

	@Override
	public PageBean getPageBeanBackOrder(int pageIndex, int pageSize) {
		PageBean<Order> pageBean = new PageBean<Order>();
		pageBean.setPageIndex(pageIndex);
		pageBean.setPageSize(pageSize);
		int totalCount = orderDao.findTotalCountBackOrder();
		pageBean.setTotalCount(totalCount);
		int totalPage =(int) Math.ceil((double) totalCount / pageSize );
		pageBean.setTotalPage(totalPage);
		int index =( pageIndex - 1) * pageSize;
		List<Order> list = orderDao.findBackOrderBeanList(index, pageSize);
		pageBean.setList(list);
		return pageBean;
	}
}

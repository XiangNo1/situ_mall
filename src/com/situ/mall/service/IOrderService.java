package com.situ.mall.service;

import com.situ.mall.pojo.Order;
import com.situ.mall.vo.PageBean;

public interface IOrderService {

	boolean addOrder(Order order);

	PageBean getPageBeanBackOrder(int pageIndex, int pageSize);

}

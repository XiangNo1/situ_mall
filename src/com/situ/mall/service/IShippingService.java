package com.situ.mall.service;

import java.util.List;

import com.situ.mall.pojo.Shipping;
import com.situ.mall.vo.PageBean;

public interface IShippingService {

	List<Shipping> findShippingByUserId(Integer id);

	List<Shipping> findShipping();

	PageBean getPageBeanShipping(int pageIndex, int pageSize);

	boolean addShipping(Shipping shipping);

	boolean deleteShippingByid(Integer id);

	Shipping findShippingById(Integer id);

	boolean updateShipping(Shipping shipping);

}

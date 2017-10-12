package com.situ.mall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mall.dao.ShippingDao;
import com.situ.mall.pojo.Shipping;

@Service
public class ShippingService implements IShippingService{

	@Autowired
	private ShippingDao shippingDao;

	@Override
	public List<Shipping> findShippingByUserId(Integer id) {
		// TODO Auto-generated method stub
		return shippingDao.findShippingByUserId(id);
	}
}

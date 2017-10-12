package com.situ.mall.service;

import java.util.List;

import com.situ.mall.pojo.Shipping;

public interface IShippingService {

	List<Shipping> findShippingByUserId(Integer id);

}

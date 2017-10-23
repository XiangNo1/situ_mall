package com.situ.mall.service;

import java.util.List;

import com.situ.mall.pojo.Area;
import com.situ.mall.pojo.City;
import com.situ.mall.pojo.Province;

public interface IProvinceService {

	List<Province> selectProvinces();

	List<City> selectCitys(int province);

	int findProvincesByname(String province);

	int findCitysByname(String city);

	List<Area> selectAreas(int cityId);

	
}

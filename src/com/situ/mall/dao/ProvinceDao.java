package com.situ.mall.dao;

import java.util.List;

import com.situ.mall.pojo.Area;
import com.situ.mall.pojo.City;
import com.situ.mall.pojo.Province;

public interface ProvinceDao {

	List<Province> selectProvinces();

	List<City> selectCitys(int province);

	List<Province> findProvincesByname(String province);

	List<City> findCitysByname(String city);

	List<Area> selectAreas(int cityId);

}

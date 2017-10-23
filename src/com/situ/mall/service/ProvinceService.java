package com.situ.mall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mall.dao.ProvinceDao;
import com.situ.mall.pojo.Area;
import com.situ.mall.pojo.City;
import com.situ.mall.pojo.Province;

@Service
public class ProvinceService implements IProvinceService {

	@Autowired
	private ProvinceDao provinceDao;

	@Override
	public List<Province> selectProvinces() {
		// TODO Auto-generated method stub
		return provinceDao.selectProvinces();
	}

	@Override
	public List<City> selectCitys(int province) {
		// TODO Auto-generated method stub
		return provinceDao.selectCitys(province);
	}

	@Override
	public int findProvincesByname(String province) {
		// TODO Auto-generated method stub
		List<Province> provinces = provinceDao.findProvincesByname(province);
		Integer i = null;
		for (Province province1 : provinces) {
			i = province1.getId();
		}
		return i;
	}

	@Override
	public int findCitysByname(String city) {
		// TODO Auto-generated method stub
		List<City> citys = provinceDao.findCitysByname(city);
		Integer i = null;
		for (City city1 : citys) {
			i = city1.getId();
		}
		return i;
	}

	@Override
	public List<Area> selectAreas(int cityId) {
		// TODO Auto-generated method stub
		return provinceDao.selectAreas(cityId);
	}
	
}

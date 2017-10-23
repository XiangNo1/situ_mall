package com.situ.mall.controller.front;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.mall.pojo.Area;
import com.situ.mall.pojo.City;
import com.situ.mall.pojo.Province;
import com.situ.mall.service.IProvinceService;

@Controller
@RequestMapping(value="/province")
public class ProvinceController {

	@Autowired
    IProvinceService provinceService;
    @RequestMapping("/selectProvinces")
    public @ResponseBody List<Province> selectProvinces() {
       return provinceService.selectProvinces();
    }
    
    @RequestMapping("/selectCitys")
    public @ResponseBody List<City> selectCitys(HttpServletRequest reqeust) throws UnsupportedEncodingException {
    	String province2 = new String(reqeust.getParameter("province").getBytes("ISO-8859-1"),"utf-8");
    	System.out.println(province2);
    	int provinceId = provinceService.findProvincesByname(province2);
       return provinceService.selectCitys(provinceId);
    }
    
    @RequestMapping("/selectAreas")
    public @ResponseBody List<Area> selectAreas(HttpServletRequest reqeust) throws UnsupportedEncodingException {
    	String city2 = new String(reqeust.getParameter("city").getBytes("ISO-8859-1"),"utf-8");
    	System.out.println(city2);
    	int cityId = provinceService.findCitysByname(city2);
       return provinceService.selectAreas(cityId);
    }

}

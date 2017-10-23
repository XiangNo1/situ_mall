package com.situ.mall.pojo;

import java.io.Serializable;

public class City implements Serializable{
	private Integer id;
	private String city;
	 private Integer province_id;
	public City(Integer id, String city, Integer province_id) {
		super();
		this.id = id;
		this.city = city;
		this.province_id = province_id;
	}
	public City() {
		super();
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public Integer getProvince_id() {
		return province_id;
	}
	public void setProvince_id(Integer province_id) {
		this.province_id = province_id;
	}
	@Override
	public String toString() {
		return "City [id=" + id + ", city=" + city + ", province_id=" + province_id + "]";
	}
	 

}

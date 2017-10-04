package com.situ.mall.vo;

import java.io.Serializable;

import com.situ.mall.pojo.Product;

public class SearchProductByCondition implements Serializable {

	private Integer pageIndex;
	private Integer pageSize;
	private Product product;
	public SearchProductByCondition(Integer pageIndex, Integer pageSize) {
		super();
		this.pageIndex = pageIndex;
		this.pageSize = pageSize;
	}
	public SearchProductByCondition() {
		super();
	}
	public SearchProductByCondition(Integer pageIndex, Integer pageSize, Product product) {
		super();
		this.pageIndex = pageIndex;
		this.pageSize = pageSize;
		this.product = product;
	}
	public Integer getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	@Override
	public String toString() {
		return "SearchProductByCondition [pageIndex=" + pageIndex + ", pageSize=" + pageSize + ", product=" + product
				+ "]";
	}
	
}

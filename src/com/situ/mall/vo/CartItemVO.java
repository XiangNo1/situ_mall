package com.situ.mall.vo;

import com.situ.mall.pojo.Product;

public class CartItemVO {

	private Product product;
	private Integer amount;
	public CartItemVO(Product product, Integer amount) {
		super();
		this.product = product;
		this.amount = amount;
	}
	public CartItemVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	@Override
	public String toString() {
		return "CartItemVO [product=" + product + ", amount=" + amount + "]";
	}
	
}

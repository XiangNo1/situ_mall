package com.situ.mall.vo;

import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class BuyCartVO {

	private List<CartItemVO> items = new ArrayList<CartItemVO>();
	private Integer productId;
	
	
	
	public void addItem(CartItemVO cartItemVO) {
		boolean isExist = false;
		//1.这件商品原来在购物车里面有，我们只需要更新购买数量
		for (CartItemVO item : items) {
			if (item.getProduct().getId() == cartItemVO.getProduct().getId()) {
				isExist = true;
				int amount = item.getAmount() + cartItemVO.getAmount();
				//购买这件商品的总数量应该<=product.stock
				if (amount <= cartItemVO.getProduct().getStock() && amount >0) {
					item.setAmount(amount);
				}else if (amount <= 0) {
					item.setAmount(0);
				} 
				else {
					//超出购买限制，最大只能购买这件商品的最大库存
					item.setAmount(item.getProduct().getStock());
				}
				break;
			}
		}
		//2.这件商品原来没有加入购物车,加入购物车
		if (isExist == false) {
			items.add(cartItemVO);
		}
	}
	
	@JsonIgnore
	public double getTotalPrice() {
		Double totalPrice = 0.0;
		for (CartItemVO item : items) {
			totalPrice += item.getAmount() * item.getProduct().getPrice().doubleValue();
		}
		return totalPrice;
	}

	public List<CartItemVO> getItems() {
		return items;
	}

	public void setItems(List<CartItemVO> items) {
		this.items = items;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	@Override
	public String toString() {
		return "BuyCartVO [items=" + items + ", productId=" + productId + "]";
	}
	
}

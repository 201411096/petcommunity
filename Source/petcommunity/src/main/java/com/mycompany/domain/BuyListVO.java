package com.mycompany.domain;

public class BuyListVO {

	private int productId;
	private int buyCnt;
	private int productTotalPrice;
	private int totalPrice;
	
	
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getBuyCnt() {
		return buyCnt;
	}
	public void setBuyCnt(int buyCnt) {
		this.buyCnt = buyCnt;
	}
	public int getProductTotalPrice() {
		return productTotalPrice;
	}
	public void setProductTotalPrice(int productTotalPrice) {
		this.productTotalPrice = productTotalPrice;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	
}

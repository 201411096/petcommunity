package com.mycompany.domain;

public class BuylistviewVO {

	private String buylistDate;
	private String productName;
	private int buyCnt;
	private int buyTotalprice;
	
	public String getBuylistDate() {
		return buylistDate;
	}
	public void setBuylistDate(String buylistDate) {
		this.buylistDate = buylistDate;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getBuyCnt() {
		return buyCnt;
	}
	public void setBuyCnt(int buyCnt) {
		this.buyCnt = buyCnt;
	}
	public int getBuyTotalprice() {
		return buyTotalprice;
	}
	public void setBuyTotalprice(int buyTotalprice) {
		this.buyTotalprice = buyTotalprice;
	}
	
}

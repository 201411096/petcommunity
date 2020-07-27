package com.mycompany.domain;

public class BuyVO {
	private String buyId;
	private String buylistDate;
	private String productName;
	private int buyCnt;
	private String buylistTotalprice; 
	
	
	public String getBuyId() {
		return buyId;
	}
	public void setBuyId(String buyId) {
		this.buyId = buyId;
	}
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
	public String getBuylistTotalprice() {
		return buylistTotalprice;
	}
	public void setBuylistTotalprice(String buylistTotalprice) {
		this.buylistTotalprice = buylistTotalprice;
	}
	
}

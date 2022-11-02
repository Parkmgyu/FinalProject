package com.example.project.model.shop.dto;

public class CartDTO {
	private int cart_id; 	//장바구니 번호
	private String userid;  //아이디
	private String name;	//이름
	private int product_id;	//제품번호
	private String product_name;//제품명
	private int price; 
	private int money; //상품금액
	private int amount;
	private String picture_url; // 제품이미지 추가
	
	//getter setter toString()
	
	
	public int getCart_id() {
		return cart_id;
	}
	public String getPicture_url() {
		return picture_url;
	}
	public void setPicture_url(String picture_url) {
		this.picture_url = picture_url;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	@Override
	public String toString() {
		return "CartDTO [cart_id=" + cart_id + ", userid=" + userid + ", name=" + name + ", product_id=" + product_id
				+ ", product_name=" + product_name + ", price=" + price + ", money=" + money + ", amount=" + amount
				+ "]";
	}
	
}

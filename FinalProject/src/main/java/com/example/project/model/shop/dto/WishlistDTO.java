package com.example.project.model.shop.dto;

import java.util.Date;

public class WishlistDTO {
	private int wish_id;
	private String userid;
	private int product_id;
	private Date wish_regdate;
	private String product_name; //제품명
	private int price; // 단가
	private String picture_url; // 제품 이미지
	
	// getter, setter, toString
	
	public int getWish_id() {
		return wish_id;
	}
	public String getPicture_url() {
		return picture_url;
	}
	public void setPicture_url(String picture_url) {
		this.picture_url = picture_url;
	}
	public void setWish_id(int wish_id) {
		this.wish_id = wish_id;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public Date getWish_regdate() {
		return wish_regdate;
	}
	public void setWish_regdate(Date wish_regdate) {
		this.wish_regdate = wish_regdate;
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
	@Override
	public String toString() {
		return "WishlistDTO [wish_id=" + wish_id + ", userid=" + userid + ", product_id=" + product_id
				+ ", wish_regdate=" + wish_regdate + ", product_name=" + product_name + ", price=" + price + "]";
	}
	
}

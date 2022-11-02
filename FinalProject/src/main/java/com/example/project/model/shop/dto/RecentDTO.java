package com.example.project.model.shop.dto;

import java.util.Date;

public class RecentDTO {
	private String userid;
	private int product_id;
	private Date recent_regdate;
	private String picture_url;
	private String product_name;
	private int price;

	
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
	public Date getRecent_regdate() {
		return recent_regdate;
	}
	public void setRecent_regdate(Date recent_regdate) {
		this.recent_regdate = recent_regdate;
	}
	public String getPicture_url() {
		return picture_url;
	}
	public void setPicture_url(String picture_url) {
		this.picture_url = picture_url;
	}
	
	@Override
	public String toString() {
		return "RecentDTO [userid=" + userid + ", product_id=" + product_id + ", recent_regdate=" + recent_regdate
				+ ", picture_url=" + picture_url + ", product_name=" + product_name + ", price=" + price + "]";
	}
	
	

}

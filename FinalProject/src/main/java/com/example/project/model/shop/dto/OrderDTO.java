package com.example.project.model.shop.dto;

import java.util.Date;

public class OrderDTO {
	private String order_id;
	private String userid;
	private String order_rec;
	private String userAddr1;
	private String userAddr2;
	private String userAddr3;
	private String order_hp;
	private int total;
	private Date order_date;
	
	
	//getter setter toString
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getOrder_rec() {
		return order_rec;
	}
	public void setOrder_rec(String order_rec) {
		this.order_rec = order_rec;
	}
	public String getUserAddr1() {
		return userAddr1;
	}
	public void setUserAddr1(String userAddr1) {
		this.userAddr1 = userAddr1;
	}
	public String getUserAddr2() {
		return userAddr2;
	}
	public void setUserAddr2(String userAddr2) {
		this.userAddr2 = userAddr2;
	}
	public String getUserAddr3() {
		return userAddr3;
	}
	public void setUserAddr3(String userAddr3) {
		this.userAddr3 = userAddr3;
	}
	public String getOrder_hp() {
		return order_hp;
	}
	public void setOrder_hp(String order_hp) {
		this.order_hp = order_hp;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	@Override
	public String toString() {
		return "OrderDTO [order_id=" + order_id + ", userid=" + userid + ", order_rec=" + order_rec + ", userAddr1="
				+ userAddr1 + ", userAddr2=" + userAddr2 + ", userAddr3=" + userAddr3 + ", order_hp=" + order_hp
				+ ", total=" + total + ", order_date=" + order_date + "]";
	}
	
	

}

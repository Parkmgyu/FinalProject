package com.example.project.model.shop.dto;

import java.util.Date;

public class OrderDetailDTO {
	private int order_details_id; //상세주문번호
	private String order_id; //주문번호
	private String trackingNum; //운송장
	private String delivery_status; //배송상태
	private String product_id; //상품번호
	private int order_amount; //주문수량
	private int total;
	private Date order_date;
	private String product_name;
	private String userid;
	private String picture_url;
	
	//getter setter toString
	
	public String getPicture_url() {
		return picture_url;
	}
	public void setPicture_url(String picture_url) {
		this.picture_url = picture_url;
	}
	public int getOrder_details_id() {
		return order_details_id;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public void setOrder_details_id(int order_details_id) {
		this.order_details_id = order_details_id;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getTrackingNum() {
		return trackingNum;
	}
	public void setTrackingNum(String trackingNum) {
		this.trackingNum = trackingNum;
	}
	public String getDelivery_status() {
		return delivery_status;
	}
	public void setDelivery_status(String delivery_status) {
		this.delivery_status = delivery_status;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public int getOrder_amount() {
		return order_amount;
	}
	public void setOrder_amount(int order_amount) {
		this.order_amount = order_amount;
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
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	
	@Override
	public String toString() {
		return "OrderDetailDTO [order_details_id=" + order_details_id + ", order_id=" + order_id + ", trackingNum="
				+ trackingNum + ", delivery_status=" + delivery_status + ", product_id=" + product_id
				+ ", order_amount=" + order_amount + ", total=" + total + ", order_date=" + order_date
				+ ", product_name=" + product_name + ", userid=" + userid + ", picture_url=" + picture_url + "]";
	}
	
	
	
	
	
	
}

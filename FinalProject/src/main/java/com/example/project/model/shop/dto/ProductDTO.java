package com.example.project.model.shop.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class ProductDTO {
	private int product_id;		//상품id
	private String product_name;//상품명
	private int price;			//가격
	private String description; //상품설명
	private String picture_url;
	private Date prd_regdate; 	//상품 등록일
	private MultipartFile file1; //첨부파일
	private String cate_code; 
	private String userid;
	
	private String cate_code_ref;
	private String cate_name;
	
	// getter setter toString()
	
	
	public int getProduct_id() {
		return product_id;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPicture_url() {
		return picture_url;
	}
	public void setPicture_url(String picture_url) {
		this.picture_url = picture_url;
	}
	public Date getPrd_regdate() {
		return prd_regdate;
	}
	public void setPrd_regdate(Date prd_regdate) {
		this.prd_regdate = prd_regdate;
	}
	public MultipartFile getFile1() {
		return file1;
	}
	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}
	public String getCate_code() {
		return cate_code;
	}
	public void setCate_code(String cate_code) {
		this.cate_code = cate_code;
	}
	
	
	public String getCate_code_ref() {
		return cate_code_ref;
	}
	public void setCate_code_ref(String cate_code_ref) {
		this.cate_code_ref = cate_code_ref;
	}
	public String getCate_name() {
		return cate_name;
	}
	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}
	@Override
	public String toString() {
		return "ProductDTO [product_id=" + product_id + ", product_name=" + product_name + ", price=" + price
				+ ", description=" + description + ", picture_url=" + picture_url + ", prd_regdate=" + prd_regdate
				+ ", file1=" + file1 + ", cate_code=" + cate_code + ", userid=" + userid + ", cate_code_ref="
				+ cate_code_ref + ", cate_name=" + cate_name + "]";
	}
	
	
}

package com.example.project.model.shop.dto;

public class CategoryDTO {
	private String cate_name;
	private String cate_code;
	private String cate_code_ref;
	private int level; // mapper에 level을 추가하였으므로 추가
	// getter setter toString()
	public String getCate_name() {
		return cate_name;
	}
	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
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
	
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	@Override
	public String toString() {
		return "CategoryDTO [cate_name=" + cate_name + ", cate_code=" + cate_code + ", cate_code_ref=" + cate_code_ref
				+ "]";
	}
	
}

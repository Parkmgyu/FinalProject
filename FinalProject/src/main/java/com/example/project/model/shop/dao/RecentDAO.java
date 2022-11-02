package com.example.project.model.shop.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.example.project.model.shop.dto.ProductDTO;
import com.example.project.model.shop.dto.RecentDTO;


public interface RecentDAO {
	public void insert(ProductDTO dto);// 최근 본 상품 리스트에 담기
	public List<RecentDTO> viewRecent(String userid); // 제품 상세 페이지로 이동

}
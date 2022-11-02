package com.example.project.service.shop;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.example.project.model.shop.dto.CartDTO;
import com.example.project.model.shop.dto.WishlistDTO;

public interface WishlistService {
	public void insert(WishlistDTO dto);// 위시리스트 담기
	public List<WishlistDTO> listWish(String userid);//위시리스트 상품 목록 보기
	public void delete(int product_id);//위시리스트 개별 상품 삭제
	public void deleteAll(String userid);//위시리스트 전체지우기
}

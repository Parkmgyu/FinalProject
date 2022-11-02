package com.example.project.model.shop.dao;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.project.model.shop.dto.ProductDTO;
import com.example.project.model.shop.dto.RecentDTO;

@Repository
public class RecentDAOImpl implements RecentDAO {
	
	@Inject
	SqlSession sqlSession;

	//최근본상품 담기
	@Override
	public void insert(ProductDTO dto) {
		sqlSession.insert("recent.insert",dto);

	}
	//최근본상품 리스트
	@Override
	public List<RecentDTO> viewRecent(String userid) {
		return sqlSession.selectList("recent.viewRecent",userid);
	}



}

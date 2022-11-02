package com.example.project.model.shop.dao;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.project.model.shop.dto.WishlistDTO;

@Repository
public class WishlistDAOImpl implements WishlistDAO {

	@Inject
	SqlSession sqlSession;
	
	
	@Override
	public void insert(WishlistDTO dto) {
		sqlSession.insert("wish.insert", dto);
	}

	@Override
	public List<WishlistDTO> listWish(String userid) {
		return sqlSession.selectList("wish.listWish", userid);
	}

	@Override
	public void delete(int product_id) {
		sqlSession.delete("wish.delete", product_id);

	}

	@Override
	public void deleteAll(String userid) {
		sqlSession.delete("wish.deleteAll", userid);

	}



}

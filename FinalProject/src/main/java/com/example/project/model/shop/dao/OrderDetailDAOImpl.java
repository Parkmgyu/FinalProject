package com.example.project.model.shop.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.project.model.shop.dto.OrderDTO;
import com.example.project.model.shop.dto.OrderDetailDTO;

@Repository
public class OrderDetailDAOImpl implements OrderDetailDAO {

	@Inject
	SqlSession sqlSession;

	@Override
	public void update(OrderDetailDTO dto) {
		sqlSession.selectOne("detail.update", dto);
	}

	@Override
	public OrderDetailDTO deleteOrder(String order_details_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertDelivery(OrderDetailDTO dto) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<OrderDTO> orderList() {
		return sqlSession.selectList("detail.orderList");
	}

	@Override
	public void add(OrderDetailDTO dto) {
		sqlSession.update("detail.update", dto);
	}

	@Override
	public void change(String order_id) {
		sqlSession.selectOne("detail.change", order_id);
	}

}

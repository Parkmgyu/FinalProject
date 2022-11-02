package com.example.project.model.shop.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.example.project.model.shop.dto.OrderDTO;
import com.example.project.model.shop.dto.OrderDetailDTO;

@Repository
public class OrderDAOImpl implements OrderDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public void orderInfo(OrderDTO dto) {
		sqlSession.insert("order.orderInfo",dto);
	}

	@Override
	public void orderDetailInfo(OrderDetailDTO dto) {
		sqlSession.insert("order.orderDetailInfo",dto);
	}

	@Override
	public List<OrderDTO> orderList(String userid) {
		return sqlSession.selectList("order.orderList", userid);
	}

	@Override
	public void cancel(String order_id) {
		sqlSession.update("order.cancel", order_id);
	}

}

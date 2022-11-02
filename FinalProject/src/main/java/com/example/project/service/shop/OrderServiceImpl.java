package com.example.project.service.shop;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.example.project.model.shop.dao.OrderDAO;
import com.example.project.model.shop.dto.OrderDTO;
import com.example.project.model.shop.dto.OrderDetailDTO;

@Service
public class OrderServiceImpl implements OrderService {

	
	@Inject
	OrderDAO orderDao;
	
	
	@Override
	public void orderInfo(OrderDTO dto) {
		orderDao.orderInfo(dto);

	}

	@Override
	public void orderDetailInfo(OrderDetailDTO dto) {
		orderDao.orderDetailInfo(dto);
	}

	@Override
	public List<OrderDTO> orderList(String userid) {
		return orderDao.orderList(userid);
	}

	@Override
	public void cancel(String order_id) {
		orderDao.cancel(order_id);
	}

}

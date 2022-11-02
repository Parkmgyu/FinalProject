package com.example.project.service.shop;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.project.model.shop.dao.OrderDAO;
import com.example.project.model.shop.dao.OrderDetailDAO;
import com.example.project.model.shop.dto.OrderDTO;
import com.example.project.model.shop.dto.OrderDetailDTO;

@Service
public class OrderDetailServiceImpl implements OrderDetailService {

	@Inject
	OrderDetailDAO orderdetailDAO;
	
	@Override
	public List<OrderDetailDTO> list() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(OrderDetailDTO dto) {
		orderdetailDAO.update(dto);
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
		return orderdetailDAO.orderList();
	}

	@Override
	public void add(OrderDetailDTO dto) {
		orderdetailDAO.add(dto);
	}

	@Override
	public void change(String order_id) {
		orderdetailDAO.change(order_id);
	}
}

package com.example.project.model.shop.dao;

import java.util.List;

import com.example.project.model.shop.dto.OrderDTO;
import com.example.project.model.shop.dto.OrderDetailDTO;

public interface OrderDetailDAO {
	public void update(OrderDetailDTO dto);
	public OrderDetailDTO deleteOrder(String order_details_id);
	public void insertDelivery(OrderDetailDTO dto);
	public List<OrderDTO> orderList();
	public void add(OrderDetailDTO dto);
	public void change(String order_id);
}

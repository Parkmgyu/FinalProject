package com.example.project.model.shop.dao;

import java.util.List;

import com.example.project.model.shop.dto.OrderDTO;
import com.example.project.model.shop.dto.OrderDetailDTO;

public interface OrderDAO {
	public void orderInfo(OrderDTO dto); // 주문정보 입력
	public void orderDetailInfo(OrderDetailDTO dto); // 상세주문정보 입력
	public List<OrderDTO> orderList(String userid);
	public void cancel(String order_id);
}

package com.example.project.service.shop;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.example.project.model.shop.dto.OrderDTO;
import com.example.project.model.shop.dto.OrderDetailDTO;

public interface OrderService {
	public void orderInfo(OrderDTO dto); // 주문정보 입력
	public void orderDetailInfo(OrderDetailDTO dto); // 상세주문정보 입력
	public List<OrderDTO> orderList(String userid);// 주문정보 리스트
	public void cancel(String order_id);//주문취소
}

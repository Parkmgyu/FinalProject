package com.example.project.controller.shop;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.project.model.shop.dto.OrderDTO;
import com.example.project.model.shop.dto.OrderDetailDTO;
import com.example.project.service.shop.OrderDetailService;
import com.example.project.service.shop.OrderService;

@Controller
@RequestMapping("/shop/detail/*")
public class OrderDetailController {
	
	@Inject
	OrderDetailService orderdetailService;
	@Inject
	OrderService orderService;
	
	@RequestMapping("list.do")
	public String orderList(Model model) {
		List<OrderDTO> list=orderdetailService.orderList();
		model.addAttribute("list",list);
		return "shop/admin_orderList";
	}
	
	@RequestMapping("add.do")
	public String add(OrderDetailDTO dto, HttpSession session) {
		//session.setAttribute("trackingNum", dto.getTrackingNum());
		//session.setAttribute("delivery_status", dto.getDelivery_status());
		orderdetailService.add(dto);
		return "redirect:/shop/detail/list.do";
	}
	
	@RequestMapping("change.do")
	public String change(HttpServletRequest request) {
		orderdetailService.change(request.getParameter("order_id"));
		return "redirect:/shop/detail/list.do";
	}
	
	
	@RequestMapping("order.do")
	public String order(HttpSession session, OrderDTO order, OrderDetailDTO orderDetail) {
		/*
		 * orderDetail.setDelivery_status(delivery_status);
		 * orderDetail.setTrackingNum(trackingNum);
		 */
		return "redirect:/shop/detail/list.do";
	}
	
}

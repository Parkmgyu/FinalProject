package com.example.project.controller.shop;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.model.member.dto.MemberDTO;
import com.example.project.model.shop.dto.OrderDTO;
import com.example.project.model.shop.dto.OrderDetailDTO;
import com.example.project.service.shop.CartService;
import com.example.project.service.shop.OrderService;

@Controller
@RequestMapping("/shop/order/*")
public class OrderController {

	@Inject
	OrderService orderService;

	@Inject
	CartService cartService;

	@RequestMapping("delivery.do")
	public String delivery() {
		return "shop/orderList";
	}

	//주문하기
	@RequestMapping("order.do")
	public String order(HttpSession session, OrderDTO order, OrderDetailDTO orderDetail) {


		String userid = (String)session.getAttribute("userid");

		//orderID생성 
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = year + new DecimalFormat("00").format(cal.get(Calendar.DATE));

		String subNum = ""; // 랜덤숫자
		for(int i=1; i<=6; i++) {
			subNum += (int)(Math.random() * 10);
		}

		String order_id = ymd + "_" + subNum;

		order.setOrder_id(order_id);
		order.setUserid(userid);

		orderService.orderInfo(order);

		orderDetail.setOrder_id(order_id);
		orderService.orderDetailInfo(orderDetail);

		cartService.deleteAll(userid);

		return "redirect:/shop/order/list.do";  
	}

	@RequestMapping("list.do")
	public String orderList(Model model, HttpSession session) {
		List<OrderDTO> list=orderService.orderList(session.getAttribute("userid").toString());
		model.addAttribute("list",list);
		return "shop/orderList";
	}
	
	@RequestMapping("cancel.do")
	public String cancel(HttpServletRequest request) {
		orderService.cancel(request.getParameter("order_id"));
		return "redirect:/shop/order/list.do";  
	}
}

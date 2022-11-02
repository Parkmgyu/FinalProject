package com.example.project.controller.shop;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.model.shop.dto.CartDTO;
import com.example.project.service.shop.CartService;

@Controller
@RequestMapping("/shop/cart/*")
public class CartController {
	
	@Inject
	CartService cartService;
	
	// 장바구니 목록
	@RequestMapping("list.do")
	public ModelAndView list(HttpSession session, ModelAndView mav) {
		Map<String, Object> map = new HashMap<>();
		String userid = (String)session.getAttribute("userid");
		if(userid != null) { // 로그인 한 경우
			List<CartDTO> list = cartService.listCart(userid);
			// 장바구니 합계
			int sumMoney = cartService.sumMoney(userid);
			// 배송료 ( 합계 5만원 이상 시 무료배송)
			int fee = sumMoney >= 50000 ? 0 : 3000; 
			map.put("sumMoney", sumMoney);
			map.put("fee", fee);
			map.put("sum", sumMoney + fee);
			
			map.put("list", list); // 맵에 자료 추가
			map.put("count", list.size());
			mav.setViewName("shop/cart_list");
			mav.addObject("map",map);
			return mav;
		} else { // 로그인 하지 않은 경우
			return new ModelAndView("member/login","",null);
		}
	}
	
	// 장바구니 제품 추가
	@RequestMapping("insert.do")
	public String insert(HttpSession session, @ModelAttribute CartDTO dto) {
		String userid = (String)session.getAttribute("userid");
		if(userid == null) {
			return "redirect:/member/login.do";
		}
		dto.setUserid(userid);
		cartService.insert(dto);
		
		return "redirect:/shop/cart/list.do";
	}
	
	// 장바구니 개별 상품 삭제
	@RequestMapping("delete.do")
	public String delete(@RequestParam int cart_id, HttpSession session) {
		if(session.getAttribute("userid") != null) 
			cartService.delete(cart_id);
			return "redirect:/shop/cart/list.do";
	}
	
	// 장바구니 비우기
	@RequestMapping("deleteAll.do")
	public String deleteAll(HttpSession session) {
		String userid = (String)session.getAttribute("userid");
		if(userid != null) {
			cartService.deleteAll(userid);
		}
		return "redirect:/shop/cart/list.do";
	}
	
	// 장바구니 수정
	@RequestMapping("update.do")
	public String update(@RequestParam int[] amount,
			@RequestParam int[] cart_id, HttpSession session) {
		String userid = (String)session.getAttribute("userid");
		if(userid != null) {
			for(int i=0; i<cart_id.length; i++) {
				if(amount[i] <= 0) {
					cartService.delete(cart_id[i]);
				} else {
					CartDTO dto = new CartDTO();
					dto.setUserid(userid);
					dto.setCart_id(cart_id[i]);
					dto.setAmount(amount[i]);
					cartService.modifyCart(dto);
				}
			}
		}
		return "redirect:/shop/cart/list.do";
	}
}


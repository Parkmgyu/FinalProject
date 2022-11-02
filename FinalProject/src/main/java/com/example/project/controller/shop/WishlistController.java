package com.example.project.controller.shop;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.model.shop.dto.CartDTO;
import com.example.project.model.shop.dto.RecentDTO;
import com.example.project.model.shop.dto.WishlistDTO;
import com.example.project.service.shop.CartService;
import com.example.project.service.shop.WishlistService;

@Controller
@RequestMapping("/shop/wish/*")
public class WishlistController {

	@Inject
	WishlistService wishService;
	
	@Inject
	CartService cartService;

	// 찜 목록
	@RequestMapping("list.do")
	public ModelAndView list(HttpSession session, ModelAndView mav) {
		String userid = (String) session.getAttribute("userid");
		if (userid != null) { // 로그인 한 경우
			List<WishlistDTO> list = wishService.listWish(userid);
			mav.setViewName("shop/wish_list");
			mav.addObject("list", list);
			return mav;
		} else { // 로그인 하지 않은 경우
			return new ModelAndView("member/login", "", null);
		}
	}

	// 찜하기
	@RequestMapping("insert.do")
	public String wish(HttpSession session, @ModelAttribute WishlistDTO dto) {
		String userid = (String) session.getAttribute("userid");
		if (userid == null) {
			return "redirect:/member/login.do";
		}
		dto.setUserid(userid);
		wishService.insert(dto);


		return "redirect:/shop/wish/list.do";
	}
	
	@RequestMapping("delete.do")
	public String delete(@RequestParam int product_id, HttpSession session) {
		if(session.getAttribute("userid") != null) 
			wishService.delete(product_id);
		
			return "redirect:/shop/wish/list.do";
	}
	
	@RequestMapping("deleteAll.do")
	public String deleteAll(HttpSession session) {
		String userid = (String)session.getAttribute("userid");
		if(userid != null) {
			wishService.deleteAll(userid);
		}
		return "redirect:/shop/wish/list.do";
	}
	
	// 장바구니 제품 추가
		@RequestMapping("cartinsert.do")
		public String insert(HttpSession session,@RequestParam int product_id, @ModelAttribute CartDTO dto) {
			String userid = (String)session.getAttribute("userid");
			if(userid == null) {
				return "redirect:/member/login.do";
			}
			dto.setUserid(userid);
			cartService.insert(dto);
			wishService.delete(product_id);
			
			return "redirect:/shop/cart/list.do";
		}
}

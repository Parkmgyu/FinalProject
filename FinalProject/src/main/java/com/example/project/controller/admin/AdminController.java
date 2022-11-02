package com.example.project.controller.admin;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.model.member.dto.MemberDTO;
import com.example.project.model.shop.dto.CategoryDTO;
import com.example.project.service.admin.AdminService;
import com.example.project.service.member.MemberService;
import com.example.project.service.shop.ProductService;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("admin/*")
public class AdminController {
	private static final Logger logger=LoggerFactory.getLogger(AdminController.class);

	@Inject
	AdminService adminService;

	@Inject
	MemberService memberService;

	@Inject
	ProductService productService;

	// 카테고리 상품 등록 //수정
		@RequestMapping(value = "write.do", method = {RequestMethod.GET})
		public String write(Model model) throws Exception {
		 List<CategoryDTO> category = null;
		 category = productService.category();
		 model.addAttribute("category",JSONArray.fromObject(category));
		 return "admin/admin_product_write";
		}
		
	@RequestMapping("admin.do")
	public String admin() {
		return "admin/admin";
	}

	@RequestMapping("login.do") //수정
	public String login() {
		return "admin/login";
	}

	@RequestMapping("login_check.do")
	public ModelAndView login_check(MemberDTO dto, HttpSession session, ModelAndView mav) {
		String name=adminService.loginCheck(dto);
		if(name != null) {
			session.setAttribute("admin_userid", dto.getUserid());
			session.setAttribute("admin_name", name);

			session.setAttribute("userid", dto.getUserid());
			session.setAttribute("name", name);
			mav.setViewName("admin/admin");
		} else {
			mav.setViewName("admin/login");
			mav.addObject("message", "error");
		}
		return mav;
	}

	@RequestMapping("logout.do") //수정
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/member/home.do";
	}

	@RequestMapping("list.do")
	public ModelAndView list(ModelAndView mav) {
		mav.setViewName("/admin/admin_product_list");
		mav.addObject("list", productService.listProduct());
		return mav;
	}

}


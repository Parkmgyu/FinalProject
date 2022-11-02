package com.example.project.controller.member;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.model.member.dto.MemberDTO;
import com.example.project.model.shop.dto.RecentDTO;
import com.example.project.service.member.MemberService;
import com.example.project.service.shop.RecentService;

@Controller
@RequestMapping("member/*")
public class MemberController {
	private static final Logger logger=
			LoggerFactory.getLogger(MemberController.class);
	@Inject
	MemberService memberService;

	@Inject
	RecentService recentService;

	@RequestMapping("address.do")
	public String address() {
		return "member/join";
	}


	@RequestMapping("login.do")
	public String login() {
		return "member/login";
	}

	@RequestMapping("main.do")
	public String main() {
		return "include/main";
	}

	@RequestMapping("login_check.do")
	public ModelAndView login_check(MemberDTO dto, HttpSession session) {
		ModelAndView mav=new ModelAndView();
		String result=memberService.loginCheck(dto, session); 
		if(result != null) {
			if(result.equals("1")) {//관리자
				MemberDTO dto2=memberService.viewMember(dto.getUserid());
				session.setAttribute("userid", dto.getUserid());
				session.setAttribute("name", dto2.getName());
				session.setAttribute("adminCk", dto.getAdminCk());
				mav.setViewName("include/admin_main");
				System.out.println("관리자 : "+ result);
			}else if(result.equals("0")){//일반회원
				MemberDTO dto2=memberService.viewMember(dto.getUserid());
				session.setAttribute("userid", dto.getUserid());
				session.setAttribute("name", dto2.getName());
				session.setAttribute("adminCk", dto.getAdminCk());
				mav.setViewName("include/main");
				System.out.println("일반회원 : "+ result);
			}
		} else { //비회원(adminCk==null)
			mav.setViewName("member/login");
			mav.addObject("message", "error");
			System.out.println("비회원 : "+ result);
		}
		return mav;
	}


	@RequestMapping("logout.do")
	public ModelAndView logout(HttpSession session, ModelAndView mav) {
		//세션 초기화
		memberService.logout(session);
		//login.jsp로 이동
		mav.setViewName("member/login");
		mav.addObject("message", "logout");
		return mav;
	}


	//회원리스트
	@RequestMapping("list.do")
	public String memberList(Model model) {
		List<MemberDTO> list=memberService.list();
		model.addAttribute("list",list);
		return "member/member_list";
	}
	
	
	//회원등록
	@RequestMapping("write.do")
	public String write() {
		return "member/write";
	}

	//회원정보저장
	@RequestMapping("insert.do")
	public String insert(@ModelAttribute MemberDTO dto) {
		memberService.insertMember(dto);
		return "home";
	}

	//회원수정관련(상세화면)
	/*@RequestMapping("view.do")
	public String view(@RequestParam String userid, Model model, HttpSession session) {
		model.addAttribute("dto", memberService.viewMember(userid));
		return "member/view";
	}*/
	@RequestMapping("view.do")
	public String view(@RequestParam String userid, Model model) {
		model.addAttribute("dto", memberService.viewMember(userid));
		return "member/view";
	}

	//회원수정
	@RequestMapping("update.do")
	public String update(MemberDTO dto, Model model) {
		//비번 체크
		boolean result=memberService.checkPw(dto.getUserid(), dto.getPasswd());
		if(result) {//비번이 맞으면
			//회원정보수정
			memberService.updateMember(dto);
			return "home";
		}else {
			model.addAttribute("dto", dto);
			model.addAttribute("join_date", 
					memberService.viewMember(dto.getUserid()).getJoin_date());
			model.addAttribute("message", "비밀번호를 확인하세요.");
			return "member/view";
		}
	}

	//회원삭제
	@RequestMapping("delete.do")
	public String delete(String userid, String passwd, Model model) {
		boolean result=memberService.checkPw(userid, passwd);
		if(result) {
			memberService.deleteMember(userid);
			return "home";
		}else {
			model.addAttribute("message", "비밀번호를 확인하세요.");
			model.addAttribute("dto", memberService.viewMember(userid));
			return "member/view";
		}
	}


	@RequestMapping("member_list.do")
	public ModelAndView member_list(MemberDTO dto, ModelAndView mav) {
		mav.setViewName("admin/admin_memberList");
		mav.addObject("dto", memberService.memberList());
		return mav;
	}

	@RequestMapping("detail/{userid}")
	public ModelAndView detail(@PathVariable String userid, ModelAndView mav) {
		mav.setViewName("/admin/admin_memberDetail");
		mav.addObject("dto", memberService.detailMember(userid));
		return mav;
	}
	
	//마이페이지 
		@RequestMapping("myPage.do")
		public ModelAndView showMyPage(HttpSession session) {
			String userid = (String)session.getAttribute("userid");
			ModelAndView mav = new ModelAndView();
			if(userid != null) { //로그인 할 경우
				List<RecentDTO> list = recentService.viewRecent(userid);
				mav.addObject("list",list);
				
				}
					
			mav.addObject("dto", memberService.mypageMember(userid));
			mav.setViewName("member/myPage");

			return mav;
		}
}


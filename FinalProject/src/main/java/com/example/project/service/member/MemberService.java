package com.example.project.service.member;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.example.project.model.member.dto.MemberDTO;
import com.example.project.model.shop.dto.ProductDTO;

public interface MemberService {
	public String loginCheck(MemberDTO dto, HttpSession session);
	 public void logout(HttpSession session);
	 public MemberDTO viewMember(String userid);
	 public List<MemberDTO> list();
	 public void insertMember(MemberDTO dto);
	 public void updateMember(MemberDTO dto);
	 public void deleteMember(String userid);
	 public boolean checkPw(String userid, String passwd);	
	 List<MemberDTO> memberList();
	public boolean adminCheck(MemberDTO dto, HttpSession session);
	public MemberDTO detailMember(String userid);
	public MemberDTO mypageMember(String userid);
}
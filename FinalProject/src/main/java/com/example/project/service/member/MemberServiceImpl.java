package com.example.project.service.member;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.model.member.dao.MemberDAO;
import com.example.project.model.member.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	MemberDAO memberDao;
	
	@Override
	public String loginCheck(MemberDTO dto, HttpSession session) {
		return memberDao.loginCheck(dto);
	}
	
	@Override
	public boolean adminCheck(MemberDTO dto, HttpSession session) {
		boolean result=memberDao.adminCheck(dto);
		if(result) {//관리자 로그인 성공 
			//세션변수에 값 저장 
			MemberDTO dto2=viewMember(dto.getUserid());
			session.setAttribute("userid", dto.getUserid());
			session.setAttribute("name", dto2.getName());
			session.setAttribute("adminCk", dto.getAdminCk());
			System.out.println(session.getAttribute("adminCk")); 
			} 
		return result;
	}
	
	 @Override 
	 public MemberDTO viewMember(String userid) { 
		 MemberDTO result = memberDao.viewMember(userid); 
		 if(result != null) {
			 System.out.println("DAOImpl"+userid);
		 } else {
			 System.out.println("널값들어옴");
		 }
		 return result;
	}
	 


	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}
	
	
	@Override
	public List<MemberDTO> list() {
		return memberDao.list();
	}

	@Override
	public void insertMember(MemberDTO dto) {
		memberDao.insertMember(dto);
		
	}
	@Override
	public void updateMember(MemberDTO dto) {
		memberDao.updateMember(dto);
		
	}

	@Override
	public void deleteMember(String userid) {
		memberDao.deleteMember(userid);
		
	}
	
	@Override
	public boolean checkPw(String userid, String passwd) {
		return memberDao.checkPw(userid, passwd);
	}
	

	@Override
	public List<MemberDTO> memberList() {
		return memberDao.memberList();
	}

	@Override
	public MemberDTO detailMember(String userid) {
		return memberDao.detailMember(userid);
	}

	@Override
	public MemberDTO mypageMember(String userid) {
		return memberDao.viewMember(userid); 
	}

}


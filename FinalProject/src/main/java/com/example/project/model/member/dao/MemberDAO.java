package com.example.project.model.member.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.example.project.model.member.dto.MemberDTO;

public interface MemberDAO {
	public String loginCheck(MemberDTO dto);
	public MemberDTO viewMember(String userid);
	public List<MemberDTO> list();
	public void insertMember(MemberDTO dto);
	public void updateMember(MemberDTO dto);
	public void deleteMember(String userid);
	public boolean checkPw(String userid, String passwd);
	public List<MemberDTO> memberList();
	public boolean adminCheck(MemberDTO dto);
	public MemberDTO detailMember(String userid);
	public boolean loginCheck2(MemberDTO dto);
}


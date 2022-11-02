package com.example.project.model.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.project.model.member.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public String loginCheck(MemberDTO dto) {
		return sqlSession.selectOne("member.login_check", dto); 
	}

	 @Override public MemberDTO viewMember(String userid) { 
		 MemberDTO result=sqlSession.selectOne("member.viewMember", userid); 
		 if(result != null) {
			 System.out.println("DAOImpl"+userid);
		 } else {
			 System.out.println("널값들어옴");
		 }
		 return result;
	 }
	 
	 @Override
		public List<MemberDTO> list() {
			return sqlSession.selectList("member.memberList");
		}

		@Override
		public void insertMember(MemberDTO dto) {
			sqlSession.insert("member.insertMember", dto);
			
		}
		
		@Override
		public void updateMember(MemberDTO dto) {
			sqlSession.update("member.updateMember", dto);
			
		}

		@Override
		public void deleteMember(String userid) {
			sqlSession.delete("member.deleteMember", userid);
			
		}
	 
		@Override
		public boolean checkPw(String userid, String passwd) {
			boolean result=false;
			Map<String,String> map=new HashMap<>();
			map.put("userid", userid);
			map.put("passwd", passwd);
			int count=sqlSession.selectOne("member.checkPw", map);
			//비번이 맞으면(1), 틀리면(0)
			if(count==1) result=true;
			return result;
		}

	@Override
	public List<MemberDTO> memberList() {
		return sqlSession.selectList("member.member_list");
	}

	@Override
	public MemberDTO detailMember(String userid) {
		return sqlSession.selectOne("member.memberDetail", userid);
		
	}

	@Override
	public boolean adminCheck(MemberDTO dto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean loginCheck2(MemberDTO dto) {
		String name=sqlSession.selectOne("member.login_check2", dto);
		return (name==null) ? false : true;
	}
}


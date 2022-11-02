package com.example.project.service.admin;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.project.model.admin.dao.AdminDAO;
import com.example.project.model.member.dto.MemberDTO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Inject
	AdminDAO adminDao;

	@Override
	public String loginCheck(MemberDTO dto) {
		return adminDao.loginCheck(dto);
	}

}

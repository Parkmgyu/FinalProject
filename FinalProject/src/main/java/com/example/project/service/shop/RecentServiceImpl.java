package com.example.project.service.shop;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.example.project.model.shop.dao.RecentDAO;
import com.example.project.model.shop.dto.ProductDTO;
import com.example.project.model.shop.dto.RecentDTO;

@Service
public class RecentServiceImpl implements RecentService {
	
	@Inject
	RecentDAO recentDao;

	@Override
	public void insert(ProductDTO dto) {
		recentDao.insert(dto);

	}

	@Override
	public List<RecentDTO> viewRecent(String userid) {
		return recentDao.viewRecent(userid);

	}

}

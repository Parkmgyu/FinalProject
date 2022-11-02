package com.example.project.service.shop;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.example.project.model.shop.dao.WishlistDAO;
import com.example.project.model.shop.dto.WishlistDTO;

@Service
public class WishlistServiceImpl implements WishlistService {

	@Inject
	WishlistDAO wishDao;
	
	@Override
	public void insert(WishlistDTO dto) {
		wishDao.insert(dto);
	}

	@Override
	public List<WishlistDTO> listWish(String userid) {
		return wishDao.listWish(userid);
	}

	@Override
	public void delete(int product_id) {
		wishDao.delete(product_id);

	}

	@Override
	public void deleteAll(String userid) {
		wishDao.deleteAll(userid);

	}


		
	}



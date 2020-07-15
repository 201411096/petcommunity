package com.mycompany.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.mycompany.dao.ShopDAOImpl;
import com.mycompany.domain.ShopVO;


@Service("shopService")
public class ShopServiceImpl implements ShopService{
	
	@Autowired
	private ShopDAOImpl shopDAO;
	@Override
	public List<ShopVO> selectShop(ShopVO vo) {
		return shopDAO.selectShop(vo);
	}

}

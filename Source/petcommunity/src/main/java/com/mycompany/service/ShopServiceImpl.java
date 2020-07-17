package com.mycompany.service;

import java.util.Map;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.mycompany.dao.ShopDAOImpl;
import com.mycompany.domain.PaginationVO;
import com.mycompany.domain.ShopVO;


@Service("shopService")
public class ShopServiceImpl implements ShopService{
	
	@Autowired
	private ShopDAOImpl shopDAO;

	@Override
	public List<ShopVO> selectShopAll() {
		return shopDAO.selectShopAll();
	}
	
	@Override
	public List<ShopVO> selectShopCategory(ShopVO vo) {
		return shopDAO.selectShopCategory(vo);
	}

	@Override
	public int selectShopCntByTag(String tagCategory) {
		return shopDAO.selectShopCntByTag(tagCategory);
	}

	@Override
	public List<ShopVO> selectShopByTagWithPaging(Map searchListMap) {
		return shopDAO.selectShopByTagWithPaging(searchListMap);
	}
}

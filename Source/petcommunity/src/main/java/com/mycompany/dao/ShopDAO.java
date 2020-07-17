package com.mycompany.dao;

import java.util.List;

import com.mycompany.domain.ShopVO;

public interface ShopDAO {

	public List<ShopVO> selectShopAll();
	public List<ShopVO> selectShopCategory(ShopVO vo);
	public List<ShopVO> selectShopName(ShopVO vo);
}

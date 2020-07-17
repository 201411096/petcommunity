package com.mycompany.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mycompany.domain.ShopVO;

public interface ShopService {
	public List<ShopVO> selectShopAll();
	public List<ShopVO> selectShopCategory(ShopVO vo);
	public List<ShopVO> selectShopName(ShopVO vo);
	
}

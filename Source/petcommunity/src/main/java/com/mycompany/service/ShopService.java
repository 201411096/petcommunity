package com.mycompany.service;

import java.util.Map;
import java.util.List;

import org.springframework.stereotype.Service;

import com.mycompany.domain.PaginationVO;
import com.mycompany.domain.ShopVO;

public interface ShopService {
	
	public List<ShopVO> selectShopByTagWithPaging(Map searchListMap);
	public List<ShopVO> selectShopCategoryList(Map searchMap);
}

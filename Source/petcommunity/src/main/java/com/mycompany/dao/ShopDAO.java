package com.mycompany.dao;

import java.util.Map;
import java.util.List;

import com.mycompany.domain.PaginationVO;
import com.mycompany.domain.ShopVO;

public interface ShopDAO {

	public List<ShopVO> selectShopByTagWithPaging(Map searchListMap);
	public List<ShopVO> selectShopCategoryList(Map searchMap);
	public List<ShopVO> selectSearchKeyWordList(Map searchKeyWord);
}
package com.mycompany.dao;

import java.util.Map;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.domain.PaginationVO;
import com.mycompany.domain.ShopVO;

@Repository("shopDAO")
public class ShopDAOImpl implements ShopDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public List<ShopVO> selectShopByTagWithPaging(Map searchListMap) {
		List<ShopVO> result = mybatis.selectList("ShopDAO.selectShopByTagWithPaging", searchListMap);
		return result;
	}

	@Override
	public List<ShopVO> selectShopCategoryList(Map searchMap) {
		List<ShopVO> result = mybatis.selectList("ShopDAO.selectShopCategoryList", searchMap);
		return result;
	}

	@Override
	public List<ShopVO> selectSearchKeyWordList(Map searchKeyWord) {
		System.out.println("다오 키워드" + searchKeyWord);
		List<ShopVO> result = mybatis.selectList("ShopDAO.selectSearchKeyWordList", searchKeyWord);
		for(ShopVO i : result) {
			System.out.println("dao"+i.getShopProductname());
		}
		System.out.println("dao"+result);
		return result;
	}
}

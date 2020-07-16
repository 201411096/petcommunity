package com.mycompany.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.domain.ShopVO;

@Repository("shopDAO")
public class ShopDAOImpl implements ShopDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public List<ShopVO> selectShopAll() {
		return mybatis.selectList("ShopDAO.selectShopAll"); 
	}

}

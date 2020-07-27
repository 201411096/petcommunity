package com.mycompany.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.domain.ProductVO;

@Repository("adminDAO")
public class AdminDAOImpl implements AdminDAO{
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<ProductVO> getSalesList() {
	
		return mybatis.selectList("admin.adminselectList");
				/*mybatis.selectList("admin.adminselectList");*/
	}

}

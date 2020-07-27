package com.mycompany.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("adminDAO")
public class AdminDAOImpl implements AdminDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<Map> getSaleshistoryList(Map map) {
		
		return mybatis.selectList("adminDAO.getSaleshistoryList", map);
	}

//	public List<Map> selectFindBoardWithPaging(Map map) {
//		
//		return mybatis.selectList("adminDAO.selectFindBoardWithPaging", map);
//	}

}

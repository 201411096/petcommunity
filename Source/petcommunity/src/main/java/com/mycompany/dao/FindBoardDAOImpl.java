package com.mycompany.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.domain.FindBoardVO;

@Repository("findBoardDAO")
public class FindBoardDAOImpl implements FindBoardDAO{
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<FindBoardVO> selectProduct(FindBoardVO findBoardVO){
		return mybatis.selectList("findBoardDAO.getFindBoardList", findBoardVO);
	}

	@Override
	public List<FindBoardVO> selectProductWithPaging(Map map) {
		return mybatis.selectList("findBoardDAO.getFindBoardListWithPaging", map);
	}
}

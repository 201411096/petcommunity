package com.mycompany.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.domain.CommunityVO;


@Repository("communityDAO")
public class CommunityDAOImpl implements CommunityDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public int writeIntoBoard(CommunityVO vo) {
		System.out.println("===>  CommunityMapper writeIntoBoard() 호출");
		return mybatis.insert("communityDAO.writeIntoBoard", vo);
	}

	@Override
	public List<CommunityVO> getBoardList() {
		System.out.println("===>  CommunityMapper getBoardList() 호출");
		return mybatis.selectList("communityDAO.getBoardList");
	}

	@Override
	public CommunityVO getBoardContent(CommunityVO vo) {
		System.out.println("===>  CommunityMapper getBoardContent() 호출");
		return mybatis.selectOne("communityDAO.getBoardContent", vo);
	}
	
	
}

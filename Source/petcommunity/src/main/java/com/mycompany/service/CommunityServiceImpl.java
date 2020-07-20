package com.mycompany.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.dao.CommunityDAOImpl;
import com.mycompany.domain.CommunityVO;


@Service("communityService")
public class CommunityServiceImpl implements CommunityService{
	
	@Autowired
	CommunityDAOImpl communityDAO;
	
	@Override
	public int writeIntoBoard(CommunityVO vo) {
		return communityDAO.writeIntoBoard(vo);
	}

	@Override
	public List<CommunityVO> getBoardList() {		
		return communityDAO.getBoardList();
	}

	@Override
	public CommunityVO getBoardContent(CommunityVO vo) {		
		return communityDAO.getBoardContent(vo);
	}

	@Override
	public List<CommunityVO> getBoardListBySearch(CommunityVO vo) {		
		return communityDAO.getBoardListBySearch(vo);
	}

	@Override
	public List<CommunityVO> getBoardListByLocation(CommunityVO vo) {
		return communityDAO.getBoardListByLocation(vo);
	}
	
	public void addReadCount(CommunityVO vo) {
		communityDAO.addReadCount(vo);
	}
	

	@Override
	public List<CommunityVO> getBoardListByReadCount() {
		return communityDAO.getBoardListByReadCount();
	}

	@Override
	public List<CommunityVO> getBoardListByRecommend() {
		return communityDAO.getBoardListByRecommend();
	}

	
	
}

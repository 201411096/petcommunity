package com.mycompany.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.dao.CommunityDAOImpl;
import com.mycompany.domain.CommentVO;
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
	public void writeComment(CommentVO vo) {
		communityDAO.writeComment(vo);
	}
	

	@Override
	public List<CommunityVO> getBoardListByReadCount() {
		return communityDAO.getBoardListByReadCount();
	}

	@Override
	public List<CommunityVO> getBoardListByRecommend() {
		return communityDAO.getBoardListByRecommend();
	}

	@Override
	public List<CommentVO> getCommentContent(CommentVO vo) {
		return communityDAO.getCommentContent(vo);
	}

	@Override
	public void deleteOnCommunityBoard(CommunityVO vo) {
		communityDAO.deleteOnCommunityBoard(vo);		
	}

	@Override
	public void deleteBoardComment(CommentVO vo) {
		communityDAO.deleteBoardComment(vo);		
	}

	@Override
	public void modifyBoardContent(CommunityVO vo) {
		communityDAO.modifyBoardContent(vo);	
	}

	@Override
	public void commentDelete(CommentVO vo) {
		communityDAO.commentDelete(vo);	
	}

	@Override
	public void likeContent(CommunityVO vo) {
		communityDAO.likeContent(vo);
		
	}

	@Override
	public void dislikeContent(CommunityVO vo) {
		communityDAO.dislikeContent(vo);	
	}

	@Override
	public List<CommunityVO> communityBoardListByPaging(CommunityVO vo) {	
		return communityDAO.communityBoardListByPaging(vo);
	}

	@Override
	public List<CommunityVO> communityBoardListBySearchPaging(CommunityVO vo) {
		return communityDAO.communityBoardListBySearchPaging(vo);
	}

	
	
}

package com.mycompany.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.domain.CommentVO;
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

	@Override
	public List<CommunityVO> getBoardListBySearch(CommunityVO vo) {	
		System.out.println("===>  CommunityMapper getBoardListBySearch() 호출");
		return mybatis.selectList("communityDAO.getBoardListBySearch", vo);
	}

	@Override
	public List<CommunityVO> getBoardListByLocation(CommunityVO vo) {
		System.out.println("===>  CommunityMapper getBoardListByLocation() 호출");
		return mybatis.selectList("communityDAO.getBoardListByLocation", vo);
	}

	@Override
	public List<CommunityVO> getBoardListByReadCount() {
		System.out.println("===>  CommunityMapper getBoardListByReadCount() 호출");
		return mybatis.selectList("communityDAO.getBoardListByReadCount");
	}

	@Override
	public List<CommunityVO> getBoardListByRecommend() {
		System.out.println("===>  CommunityMapper getBoardListByRecommend() 호출");
		return mybatis.selectList("communityDAO.getBoardListByRecommend");
	}

	@Override
	public void addReadCount(CommunityVO vo) {
		System.out.println("===>  CommunityMapper addReadCount() 호출");
		mybatis.update("communityDAO.addReadCount", vo);
		
	}

	@Override
	public void writeComment(CommentVO vo) {
		System.out.println("===>  CommunityMapper writeComment() 호출");
		mybatis.insert("communityDAO.writeComment", vo);
		
	}

	@Override
	public List<CommentVO> getCommentContent(CommentVO vo) {
		System.out.println("===>  CommunityMapper writeComment() 호출");
		return mybatis.selectList("communityDAO.getCommentContent", vo);
	}

	@Override
	public void deleteOnCommunityBoard(CommunityVO vo) {
		System.out.println("===>  CommunityMapper deleteOnCommunityBoard() 호출");
		mybatis.delete("communityDAO.deleteOnCommunityBoard", vo);		
	}

	@Override
	public void deleteBoardComment(CommentVO vo) {
		System.out.println("===>  CommunityMapper deleteBoardComment() 호출");
		mybatis.delete("communityDAO.deleteBoardComment", vo);				
	}

	@Override
	public void modifyBoardContent(CommunityVO vo) {
		System.out.println("===>  CommunityMapper modifyBoardContent() 호출");
		mybatis.delete("communityDAO.modifyBoardContent", vo);
		
	}

	@Override
	public void commentDelete(CommentVO vo) {
		System.out.println("===>  CommunityMapper commentDelete() 호출");
		mybatis.delete("communityDAO.commentDelete", vo);	
	}

	@Override
	public void likeContent(CommunityVO vo) {
		System.out.println("===>  CommunityMapper likeContent() 호출");
		mybatis.delete("communityDAO.likeContent", vo);	
	}

	@Override
	public void dislikeContent(CommunityVO vo) {
		System.out.println("===>  CommunityMapper dislikeContent() 호출");
		mybatis.delete("communityDAO.dislikeContent", vo);		
	}

	@Override
	public List<CommunityVO> communityBoardListByPaging(CommunityVO vo) {
		System.out.println("===>  CommunityMapper communityBoardListByPaging() 호출");
		return mybatis.selectList("communityDAO.communityBoardListByPaging", vo);
	}

	@Override
	public List<CommunityVO> communityBoardListBySearchPaging(CommunityVO vo) {
		System.out.println("===>  CommunityMapper communityBoardListBySearchPaging() 호출");
		return mybatis.selectList("communityDAO.communityBoardListBySearchPaging", vo);
		
	}
	
	
}

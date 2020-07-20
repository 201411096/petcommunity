package com.mycompany.dao;

import java.util.List;

import com.mycompany.domain.CommentVO;
import com.mycompany.domain.CommunityVO;

public interface CommunityDAO {
	public int writeIntoBoard(CommunityVO vo);
	public List<CommunityVO> getBoardList();
	public CommunityVO getBoardContent(CommunityVO vo);
	public List<CommunityVO> getBoardListBySearch(CommunityVO vo);
	public List<CommunityVO> getBoardListByLocation(CommunityVO vo);
	public List<CommunityVO> getBoardListByReadCount();
	public List<CommunityVO> getBoardListByRecommend();
	public void addReadCount(CommunityVO vo);
	public void writeComment(CommentVO vo);
	public List<CommentVO> getCommentContent(CommentVO vo);
}

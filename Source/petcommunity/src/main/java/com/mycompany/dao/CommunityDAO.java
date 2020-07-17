package com.mycompany.dao;

import java.util.List;

import com.mycompany.domain.CommunityVO;

public interface CommunityDAO {
	public int writeIntoBoard(CommunityVO vo);
	public List<CommunityVO> getBoardList();
	public CommunityVO getBoardContent(CommunityVO vo);
}

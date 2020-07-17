package com.mycompany.service;

import java.util.List;

import com.mycompany.domain.CommunityVO;


public interface CommunityService {
	public int writeIntoBoard(CommunityVO vo);
	public List<CommunityVO> getBoardList();
	public CommunityVO getBoardContent(CommunityVO vo);
}

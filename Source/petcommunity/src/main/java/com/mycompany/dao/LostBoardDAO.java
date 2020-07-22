package com.mycompany.dao;

import java.util.List;
import java.util.Map;

import com.mycompany.domain.LostBoardVO;

public interface LostBoardDAO {
	public List<LostBoardVO> selectLostBoard(Map map);
	public List<LostBoardVO> selectLostBoardWithPaging(Map map);
	public int insertLostBoard(LostBoardVO lostBoardVO);
	public LostBoardVO getLostBoard(LostBoardVO lostBoardVO);
	public int increaseLostBoardReadcount(LostBoardVO lostBoardVO);
	public int deleteLostBoard(LostBoardVO lostBoardVO);
	public int updateLostBoard(LostBoardVO lostBoardVO);
	public List<String> selectString(Map map);
}

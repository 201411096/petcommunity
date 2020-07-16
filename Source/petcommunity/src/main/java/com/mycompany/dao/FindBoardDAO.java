package com.mycompany.dao;

import java.util.List;

import com.mycompany.domain.FindBoardVO;

public interface FindBoardDAO {
	public List<FindBoardVO> selectProduct(FindBoardVO findBoardVO);
}

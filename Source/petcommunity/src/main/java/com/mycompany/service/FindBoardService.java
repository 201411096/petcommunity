package com.mycompany.service;

import java.util.List;

import com.mycompany.domain.FindBoardVO;

public interface FindBoardService {
	public List<FindBoardVO> selectProduct(FindBoardVO findBoardVO);
}

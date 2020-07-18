package com.mycompany.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.dao.FindBoardDAOImpl;
import com.mycompany.domain.FindBoardVO;

@Service("findBoardService")
public class FindBoardServiceImpl implements FindBoardService{
	@Autowired
	FindBoardDAOImpl findBoardDAO;

	@Override
	public List<FindBoardVO> selectFindBoard(Map map){
		return findBoardDAO.selectFindBoard(map);
	}

	@Override
	public List<FindBoardVO> selectFindBoardWithPaging(Map map) {
		return findBoardDAO.selectFindBoardWithPaging(map);
	}

	@Override
	public int insertFindBoard(FindBoardVO findBoardVO) {
		return findBoardDAO.insertFindBoard(findBoardVO);
	}
}

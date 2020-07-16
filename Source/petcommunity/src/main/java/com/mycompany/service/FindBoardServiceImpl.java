package com.mycompany.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.dao.FindBoardDAOImpl;
import com.mycompany.domain.FindBoardVO;

@Service("findBoardService")
public class FindBoardServiceImpl implements FindBoardService{
	@Autowired
	FindBoardDAOImpl findBoardDAO;

	@Override
	public List<FindBoardVO> selectProduct(FindBoardVO findBoardVO) {
		return findBoardDAO.selectProduct(findBoardVO);
	}
}

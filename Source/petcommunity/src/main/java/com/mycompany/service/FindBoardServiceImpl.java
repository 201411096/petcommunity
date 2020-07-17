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
	public List<FindBoardVO> selectProduct(Map map){
		return findBoardDAO.selectProduct(map);
	}

	@Override
	public List<FindBoardVO> selectProductWithPaging(Map map) {
		return findBoardDAO.selectProductWithPaging(map);
	}
}

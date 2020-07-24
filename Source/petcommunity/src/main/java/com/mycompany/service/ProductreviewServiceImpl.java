package com.mycompany.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.dao.ProductreviewDAOImpl;

@Service("productreviewService")
public class ProductreviewServiceImpl implements ProductreviewService{
	@Autowired
	ProductreviewDAOImpl ProductreviewDAO;
	@Override
	public int reviewCheck(Map searchMap) {
		int result = ProductreviewDAO.reviewCheck(searchMap);
		return result;
	}
	
}

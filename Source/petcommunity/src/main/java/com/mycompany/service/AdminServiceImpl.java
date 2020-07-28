package com.mycompany.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.dao.AdminDAOImpl;
import com.mycompany.domain.BuylistviewVO;

@Service("adminService")
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDAOImpl adminDAO;

	@Override
	public List<BuylistviewVO> getSalesList(BuylistviewVO buylistviewvo) {
		return adminDAO.getSalesList(buylistviewvo); 
	}

	@Override
	public List<BuylistviewVO> getSearchDate(Map map) {
		return adminDAO.getSearchDate(map);
	}
	
	
	
}

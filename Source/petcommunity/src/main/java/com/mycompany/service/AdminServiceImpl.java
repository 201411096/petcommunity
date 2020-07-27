package com.mycompany.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.dao.AdminDAOImpl;

@Service("adminService")
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDAOImpl adminDAO;
	
	@Override
	public List<Map> getSaleshistoryList(Map map) {
		
		return adminDAO.getSaleshistoryList(map);
	}

//	@Override
//	public List<Map> selectFindBoardWithPaging(Map map) {
//		
//		return adminDAO.selectFindBoardWithPaging(map);
//	}

}

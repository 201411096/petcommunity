package com.mycompany.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.domain.FindHospitalVO;

@Repository("findHospitalDAO")
public class FindHospitalDAOImpl implements FindHospitalDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;
	@Override
	public List<FindHospitalVO> findHospital(FindHospitalVO findHospitalVO){
		System.out.println(findHospitalVO.getFindhospitalAddress());
		return mybatis.selectList("findHospitalDAO.getFindHospitalList", findHospitalVO);
	}
}

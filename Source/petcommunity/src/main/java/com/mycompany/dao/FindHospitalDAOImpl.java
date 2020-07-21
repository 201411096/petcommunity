package com.mycompany.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.mycompany.domain.FindHospitalVO;

@Repository("findHospitalDAO")
public class FindHospitalDAOImpl implements FindHospitalDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public List<FindHospitalVO> selectFindHospitalWithPaging(Map map) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<FindHospitalVO> selectFindHospitalList(Map map) {
		// TODO Auto-generated method stub
		return null;
	}
}

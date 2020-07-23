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
		return mybatis.selectList("findHospitalDAO.getFindHospitalListWithPaging", map);
	}
	
	@Override
	public List<FindHospitalVO> selectFindHospitalList(Map map) {
		return mybatis.selectList("findHospitalDAO.getFindHospitalList", map);
	}
	
	@Override
	public List<FindHospitalVO> getFindHospitalListByLocation(FindHospitalVO vo) {
		System.out.println("===>  HospitalMapper getFindHospitalListByLocation() 호출");
		return mybatis.selectList("findHospitalDAO.getFindHospitalListByLocation", vo);	
	}
	
	@Override
	public List<FindHospitalVO> getFindHospitalListBySearch(FindHospitalVO vo) {
		System.out.println("===>  HospitalMapper getFindHospitalListBySearch() 호출");
		return mybatis.selectList("findHospitalDAO.getFindHospitalListBySearch", vo);
	}

}


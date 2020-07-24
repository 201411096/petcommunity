package com.mycompany.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mycompany.dao.FindHospitalDAOImpl;
import com.mycompany.domain.CommunityVO;
import com.mycompany.domain.FindHospitalVO;

@Service("findHospitalService")
public class FindHospitalServiceImpl implements FindHospitalService{
	
	@Autowired
	FindHospitalServiceImpl findHospitalDAO;

	@Override
	public List<FindHospitalVO> getFindHospitalList(Map map) {
		return findHospitalDAO.getFindHospitalList(map);
	}

	@Override
	public List<FindHospitalVO> getFindHospitalListWithPaging(Map map) {
		return findHospitalDAO.getFindHospitalListWithPaging(map);
	}

	public List<FindHospitalVO> getFindHospitalListByLocation(FindHospitalVO vo) {
		return findHospitalDAO.getFindHospitalListByLocation(vo);
	}

	@Override
	public List<FindHospitalVO> getFindHospitalListByLocationWithPaging(Map map) {
		return findHospitalDAO.getFindHospitalListByLocationWithPaging(map);
	}
	
	public List<FindHospitalVO> getFindHospitalListBySearch(FindHospitalVO vo) {
		return findHospitalDAO.getFindHospitalListBySearch(vo);
	}
	
	@Override
	public List<FindHospitalVO> getFindHospitalListBySearchWithPaging(Map map) {
		return findHospitalDAO.getFindHospitalListBySearchWithPaging(map);
	}
}

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
	public List<FindHospitalVO> selectFindHospital(Map map) {
		return findHospitalDAO.selectFindHospital(map);
	}

	@Override
	public List<FindHospitalVO> selectFindHospitalWithPaging(Map map) {
		return findHospitalDAO.selectFindHospitalWithPaging(map);
	}

	@Override
	public FindHospitalVO getFindHospital(FindHospitalVO findHospitalVO) {
		return findHospitalDAO.getFindHospital(findHospitalVO);
	}

	public List<FindHospitalVO> getFindHospitalListByLocation(FindHospitalVO vo) {
		return findHospitalDAO.getFindHospitalListByLocation(vo);
	}

	public List<CommunityVO> getFindHospitalListBySearch(FindHospitalVO vo) {
		return findHospitalDAO.getFindHospitalListBySearch(vo);
	}
}

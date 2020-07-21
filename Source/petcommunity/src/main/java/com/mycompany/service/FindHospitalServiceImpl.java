package com.mycompany.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mycompany.dao.FindHospitalDAOImpl;
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
}

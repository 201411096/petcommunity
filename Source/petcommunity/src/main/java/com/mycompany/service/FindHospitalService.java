package com.mycompany.service;

import java.util.List;
import java.util.Map;

import com.mycompany.domain.CommunityVO;
import com.mycompany.domain.FindHospitalVO;

public interface FindHospitalService {
	public List<FindHospitalVO> selectFindHospital(Map map);
	public List<FindHospitalVO> selectFindHospitalWithPaging(Map map);
	public FindHospitalVO getFindHospital(FindHospitalVO findHospitalVO);
	public List<FindHospitalVO> getFindHospitalListByLocation(FindHospitalVO vo);
}

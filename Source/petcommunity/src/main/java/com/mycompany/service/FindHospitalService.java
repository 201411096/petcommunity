package com.mycompany.service;

import java.util.List;
import java.util.Map;

import com.mycompany.domain.CommunityVO;
import com.mycompany.domain.FindHospitalVO;

public interface FindHospitalService {
	public List<FindHospitalVO> getFindHospitalList(Map map);
	public List<FindHospitalVO> getFindHospitalListWithPaging(Map map);
	public List<FindHospitalVO> getFindHospitalListByLocation(FindHospitalVO vo);
	public List<FindHospitalVO> getFindHospitalListByLocationWithPaging(Map map);
	public List<FindHospitalVO> getFindHospitalListBySearch(FindHospitalVO vo);
	public List<FindHospitalVO> getFindHospitalListBySearchWithPaging(Map map);
}


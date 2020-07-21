package com.mycompany.dao;

import java.util.List;
import java.util.Map;

import com.mycompany.domain.FindHospitalVO;

public interface FindHospitalDAO {
	public List<FindHospitalVO> selectFindHospitalWithPaging(Map map);
	public List<FindHospitalVO> selectFindHospitalList(Map map);
	
}
 
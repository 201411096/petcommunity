package com.mycompany.dao;

import java.util.List;

import com.mycompany.domain.FindBoardVO;
import com.mycompany.domain.FindHospitalVO;

public interface FindHospitalDAO {
	public List<FindHospitalVO> findHospital(FindHospitalVO findHospitalVO);
	
}
 
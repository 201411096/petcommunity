package com.mycompany.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sound.sampled.LineListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.domain.FindHospitalVO;
import com.mycompany.domain.PaginationVO;
import com.mycompany.service.FindHospitalServiceImpl;

@Controller
public class HospitalController {
	@Autowired
	FindHospitalServiceImpl findHospitalService;
	
	@ResponseBody
	@RequestMapping(value="/findHospitalListWithPaging.do", produces="application/json; charset=utf-8")
	public Map getHospitalList(@RequestParam(defaultValue="1") int curPage, String searchWord, FindHospitalVO vo) {
		System.out.println("hello");
		Map result = new HashMap();
		Map searchMap = new HashMap();
		searchMap.put("searchWord", searchWord);
		List<FindHospitalVO> findHospitalVOList = findHospitalService.selectFindHospital(searchMap);
		System.out.println("검색한 리스트");
		PaginationVO paginationVO = new PaginationVO(findHospitalVOList.size(), curPage);
		searchMap.put("startRow", paginationVO.getStartIndex()+1);
		searchMap.put("endRow", paginationVO.getStartIndex()+paginationVO.getPageSize());
		
		findHospitalVOList = findHospitalService.selectFindHospitalWithPaging(searchMap);
		result.put("pagination", paginationVO);
		result.put("findHospitalVOList", findHospitalVOList);
		result.put("findHospitalVOListSize", findHospitalVOList.size());
		return result;
		
		
		
	}

}

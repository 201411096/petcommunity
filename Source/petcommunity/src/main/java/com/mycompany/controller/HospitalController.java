package com.mycompany.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.sound.sampled.LineListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.domain.FindHospitalVO;
import com.mycompany.domain.PaginationVO;
import com.mycompany.service.FindHospitalServiceImpl;

@Controller
public class HospitalController {
	
	@Autowired
	FindHospitalServiceImpl findHospitalService;
	
	//동물 병원 찾기 게시판 첫 화면에 병원 전체 리스트를 보여준다.
	@ResponseBody
	@RequestMapping(value="/findHospitalListWithPaging.do", produces="application/json; charset=utf-8")
	public Map getHospitalList(@RequestParam(defaultValue="1") int curPage, String searchWord, String searchType) {
		System.out.println("hello");
		Map result = new HashMap();
		Map searchMap = new HashMap();
		searchMap.put("searchType", searchType);
		searchMap.put("searchWord", searchWord);
		List<FindHospitalVO> findHospitalVOList = findHospitalService.selectFindHospital(searchMap);
		PaginationVO paginationVO = new PaginationVO(findHospitalVOList.size(), curPage);
		searchMap.put("startRow", paginationVO.getStartIndex()+1);
		searchMap.put("endRow", paginationVO.getStartIndex()+paginationVO.getPageSize());
		
		findHospitalVOList = findHospitalService.selectFindHospitalWithPaging(searchMap);
		result.put("pagination", paginationVO);
		result.put("findHospitalVOList", findHospitalVOList);
		result.put("findHospitalVOListSize", findHospitalVOList.size());
		return result;		
	}
	
	
	// 지역별로 선택된 동물 병원 리스트 가져오기	
	@ResponseBody
	@RequestMapping("/getFindHospitalListByLocation.do")
	public List<FindHospitalVO> getFindHospitalListByLocation(FindHospitalVO vo, HttpServletRequest request, ModelAndView mv ){
		String cityName = request.getParameter("cityName");
		String province = request.getParameter("province");
		
		vo.setCityName(cityName);
		vo.setProvince(province.substring(0,2));
		
		List<FindHospitalVO> getFindHospitalListByLocation = findHospitalService.getFindHospitalListByLocation(vo);
		return getFindHospitalListByLocation;
	}
	
	//검색어, 병원명 typing하여 검색된 list 가져오기
	@ResponseBody
	@RequestMapping("/getFindHospitalListBySearch.do")
	public Map getFindHospitalListBySearch(@RequestParam(defaultValue = "1")int curPage, FindHospitalVO vo, HttpServletRequest request, ModelAndView mv) {
	//값이 전송되지 않으면 기본값을 1로 만든다  : defaultValue=1
	
		// parameter로 넘어온 글번호를 vo에 셋해준후 Mapper로 넘겨줌
		String searchType = request.getParameter("searchType");
		String keyword = request.getParameter("searchWord");
		System.out.println(searchType);
		System.out.println(keyword);
		String type = "";
		
		vo.setKeyWord(keyword);
		
		List<FindHospitalVO> getFindHospitalListBySearch = findHospitalService.getFindHospitalListBySearch(vo);
		Map searchMap = new HashMap();
		Map result = new HashMap();
		PaginationVO paginationVO = new PaginationVO(getFindHospitalListBySearch.size(), curPage);
		searchMap.put("startRow", paginationVO.getStartIndex()+1);
		searchMap.put("endRow", paginationVO.getStartIndex()+paginationVO.getPageSize());
		searchMap.put("searchType", searchType);
		searchMap.put("searchWord", keyword);		
		
		result.put("pagination", paginationVO);
		result.put("getFindHospitalListBySearch", getFindHospitalListBySearch);
		result.put("getFindHospitalListBySearchsize", getFindHospitalListBySearch.size());
		return result;
	
}
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


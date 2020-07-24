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
	public Map getFindHospitalList(@RequestParam(defaultValue="1") int curPage, String searchWord, FindHospitalVO vo, HttpServletRequest request, ModelAndView mv ) {
		System.out.println("동물 병원 찾기 페이지 입장");
		System.out.println("hello");
		Map result = new HashMap();
		Map searchMap = new HashMap();
		searchMap.put("searchWord", searchWord);
		List<FindHospitalVO> findHospitalVOList = findHospitalService.getFindHospitalList(searchMap);
		System.out.println(findHospitalVOList);
		PaginationVO paginationVO = new PaginationVO(findHospitalVOList.size(), curPage);
		searchMap.put("startRow", paginationVO.getStartIndex()+1);
		searchMap.put("endRow", paginationVO.getStartIndex()+paginationVO.getPageSize());
		findHospitalVOList = findHospitalService.getFindHospitalListWithPaging(searchMap);
		result.put("pagination", paginationVO);
		result.put("findHospitalVOList", findHospitalVOList);
		result.put("findHospitalVOListSize", findHospitalVOList.size());
		return result;
	}
	
	
//	public ModelAndView getFindHospitalList(FindHospitalVO vo, HttpServletRequest request, ModelAndView mv, Map map) {
//		System.out.println("동물 병원 찾기 페이지 입장");
//		//db의 모든 데이터를 가져옴
//		List<FindHospitalVO> hospitalList = findHospitalService.getFindHospitalList(map);
//		
//		//병원 10개씩 보여줌
//		int amountOfPage=(hospitalList.size()-1)/10+1; //페이지의 개수(10개씩 보여주므로 10으로 나눈후 1을 더해줌)
//		int showPage = (amountOfPage-1)/5+1; //page개수 구하기
//		
//		int pageNo=1;
//		if(request.getParameter("pageNo")!=null) {//pageNo가 파라미터로 넘어올때
//			pageNo=Integer.parseInt(request.getParameter("pageNo"));
//		}else {
//			pageNo=1;
//		}
//		if(pageNo>amountOfPage){		
//			pageNo=amountOfPage;
//		}
//			
//		
//		int showPageNo=(pageNo-1)/5;
//		int showPageStart=showPageNo*5+1; //page인덱스가 시작하는 위치
//		int showPageLast=0;
//		if((showPageNo*5+5)>amountOfPage) {//page인덱스가 마지막 인덱스를 포함한다면
//			showPageLast=showPageNo*5+amountOfPage%5;
//		}else {
//			showPageLast=showPageNo*5+5; //page인덱스가 끝나는 위치
//		}
//		
//		int startList= 20*(pageNo-1)+1;//게시판 해당 페이지 시작글
//		int lastList=startList+19; //게시판 해당 페이지 마지막글
//		if(startList-1==hospitalList.size()/20) {//마지막 페이지일때 어디까지 불러와야 하는지 정해줌
//			lastList=hospitalList.size();
//		}
//		
//		vo.setStartList(startList);
//		vo.setLastList(lastList);
//		
//		List<FindHospitalVO> hospitalListByPaging = findHospitalService.getFindHospitalListWithPaging(map);
//		
//		mv.addObject("showPageStart", showPageStart);
//		mv.addObject("showPageLast", showPageLast);
//		mv.addObject("amountOfPage", amountOfPage);
//		mv.addObject("hospitalList", hospitalListByPaging);  //게시판 리스트 저장
//		mv.setViewName("hospitalList");
//		return mv;
		
	
	
	
	// 지역별로 선택된 동물 병원 리스트 가져오기	
	@ResponseBody
	@RequestMapping("/getFindHospitalListByLocation.do")
	public Map getFindHospitalListByLocation(int curPage, FindHospitalVO vo, HttpServletRequest request, ModelAndView mv ){
		String cityName = request.getParameter("cityName");
		String province = request.getParameter("province");
		System.out.println(cityName);
		vo.setCityName(cityName);
		vo.setProvince(province.substring(0,2));
		
		List<FindHospitalVO> getFindHospitalListByLocation = findHospitalService.getFindHospitalListByLocation(vo);
		Map locationMap = new HashMap();
		PaginationVO paginationVO = new PaginationVO(findHospitalService.getFindHospitalListByLocation(vo).size(), curPage,10);
		
		paginationVO.setRangeSize(10);
		locationMap.put("startRow", paginationVO.getStartIndex()+1);
		locationMap.put("endRow", paginationVO.getStartIndex()+paginationVO.getPageSize());
		locationMap.put("cityName", cityName);
		locationMap.put("province", province.substring(0,2));
		
		List<FindHospitalVO> getFindHospitalListByLocationWithPaging = findHospitalService.getFindHospitalListByLocationWithPaging(locationMap);
		Map result = new HashMap();
		
		result.put("pagination", paginationVO);
		result.put("getFindHospitalListByLocationWithPaging", getFindHospitalListByLocationWithPaging);
		
		return result;
	}

		
	//검색어, 병원명 typing하여 검색된 list 가져오기
	@ResponseBody
	@RequestMapping("/getFindHospitalListBySearch.do")
	public Map getFindHospitalListBySearch(int curPage, FindHospitalVO vo, HttpServletRequest request, ModelAndView mv) {
	//값이 전송되지 않으면 기본값을 1로 만든다  : defaultValue=1
	
		// parameter로 넘어온 글번호를 vo에 셋해준후 Mapper로 넘겨줌
		String keyword = request.getParameter("searchWord");
		System.out.println(keyword);
		String type = "";
		
		vo.setKeyWord(keyword);
		
		
		Map searchMap = new HashMap();
		
		PaginationVO paginationVO = new PaginationVO(findHospitalService.getFindHospitalListBySearch(vo).size(), curPage, 10);
		System.out.println(findHospitalService.getFindHospitalListBySearch(vo).size());
		paginationVO.setRangeSize(10);
		searchMap.put("startRow", paginationVO.getStartIndex()+1);
		searchMap.put("endRow", paginationVO.getStartIndex()+paginationVO.getPageSize());
		searchMap.put("searchWord", keyword);		
		List<FindHospitalVO> getFindHospitalListBySearch = findHospitalService.getFindHospitalListBySearch(vo);
		Map result = new HashMap();
		result.put("pagination", paginationVO);
		result.put("getFindHospitalListBySearch", getFindHospitalListBySearch);

		return result;
	
	}
}

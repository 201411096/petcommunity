package com.mycompany.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.domain.PaginationVO;
import com.mycompany.service.AdminService;

@Controller
public class AdminController {
/*
BUYLIST_ID 
BUYLIST_DATE 
MEMBER_ID 
BUYLIST_TOTALPRICE 
*/
	@Autowired
	private AdminService adminService;
	
	/* 
    * 함수 이름 : getSaleshistoryList
    * 주요 기능 : 판매내역 목록보기, 페이징 처리
    * 함수 내용 : 
    */	
	@ResponseBody
	@RequestMapping(value="/adminPage.do", produces = "application/json; charset=utf-8")
	public Map getBuyList(@RequestParam(defaultValue="1") int curPage) {
		Map map = new HashMap();
		Map result = new HashMap();
		map.put("saleshistoryDate", map);
//		map.put("saleshistoryDate", saleshistoryDate);
//		map.put("saleshistoryName", saleshistoryName);
//		map.put("saleshistoryCnt", saleshistoryCnt);
//		map.put("saleshistoryprice", saleshistoryprice);
		List<Map> saleshistoryList = adminService.getSaleshistoryList(map);
		
		// 페이징 
//		PaginationVO paginationVO = new PaginationVO(saleshistoryList.size(), curPage);
//		map.put("startRow", paginationVO.getStartIndex()+1);
//		map.put("endRow", paginationVO.getStartIndex()+paginationVO.getPageSize());
		
//		saleshistoryList = adminService.selectFindBoardWithPaging(map);
//		result.put("pagination", paginationVO);
		result.put("saleshistoryList", saleshistoryList);
//		result.put("saleshistoryListSize", saleshistoryList.size());
		
		return result;
		
	}
}

package com.mycompany.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.domain.FindBoardVO;
import com.mycompany.domain.PaginationVO;
import com.mycompany.service.FindBoardServiceImpl;

@Controller
public class FindBoardController {
	@Autowired
	FindBoardServiceImpl findBoardService;
	
	//ajax 안 쓴 버전
//	@RequestMapping("/findboardlist.do")
//	public ModelAndView getCommunityBoardList() {
//		ModelAndView mv = new ModelAndView();
//		
//		List<FindBoardVO> findBoardVOList = findBoardService.selectProduct(new FindBoardVO());		
//		mv.setViewName("/findboardlist");
//		mv.addObject("findBoardVOList", findBoardVOList);
//		return mv;
//	}
	@ResponseBody
	@RequestMapping(value = "/findboardListWithPaging.do", produces = "application/json; charset=utf-8")
	public Map getCommunityBoardList(@RequestParam(defaultValue="1") int curPage, String searchWord) {
		Map result = new HashMap();
		List<FindBoardVO> findBoardVOList = findBoardService.selectProduct(new FindBoardVO());		
		int listCnt = findBoardVOList.size();
		PaginationVO paginationVO = new PaginationVO(listCnt, curPage);
		Map searchMap = new HashMap();
		searchMap.put("searchWord", searchWord);
		searchMap.put("startRow", paginationVO.getStartIndex()+1);
		searchMap.put("endRow", paginationVO.getStartIndex()+paginationVO.getPageSize());
		
		
		result.put("pagination", paginationVO);
//		result.put("writerList", writerList);
//		result.put("writerListSize", writerList.size());
		return result;
	}
}

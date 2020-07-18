package com.mycompany.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.domain.FindBoardVO;
import com.mycompany.domain.PaginationVO;
import com.mycompany.service.FindBoardServiceImpl;
import com.mycompany.util.FileUpload;

@Controller
public class FindBoardController {
	@Autowired
	FindBoardServiceImpl findBoardService;
	
	@ResponseBody
	@RequestMapping(value = "/findboardListWithPaging.do", produces = "application/json; charset=utf-8")
	public Map getCommunityBoardList(@RequestParam(defaultValue="1") int curPage, String searchWord, String searchType) {
		Map result = new HashMap();
		Map searchMap = new HashMap();
		searchMap.put("searchType", searchType);
		searchMap.put("searchWord", searchWord);
		List<FindBoardVO> findBoardVOList = findBoardService.selectFindBoard(searchMap);		
		PaginationVO paginationVO = new PaginationVO(findBoardVOList.size(), curPage);
		searchMap.put("startRow", paginationVO.getStartIndex()+1);
		searchMap.put("endRow", paginationVO.getStartIndex()+paginationVO.getPageSize());
				
		findBoardVOList = findBoardService.selectFindBoardWithPaging(searchMap);
		result.put("pagination", paginationVO);
		result.put("findBoardVOList", findBoardVOList);
		result.put("findBoardVOListSize", findBoardVOList.size());
		return result;
	}
	@RequestMapping(value = "/insertFindBoard.do", method=RequestMethod.POST, produces = "application/text; charset=utf-8")
	public ModelAndView insertFindBoard(FindBoardVO findBoardVO, HttpServletRequest request, MultipartHttpServletRequest mtfRequest)
	{
		ModelAndView mv = new ModelAndView();
		int insertFlag = findBoardService.insertFindBoard(findBoardVO);
		if (insertFlag == 1) {
			System.out.println(request.getSession().getServletContext().getRealPath(""));
			System.out.println(request.getSession().getServletContext().getContextPath());
			String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
			System.out.println(contextRoot);
			FileUpload.uploadFiles(mtfRequest, request.getSession().getServletContext().getRealPath("")+"/findboard");
		}
		
		mv.setViewName("/findboardlist");
		return mv;
	}
}

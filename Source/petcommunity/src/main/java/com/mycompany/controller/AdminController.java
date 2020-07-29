package com.mycompany.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.domain.BuylistviewVO;
import com.mycompany.domain.PaginationVO;
import com.mycompany.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	
	@ResponseBody
	@RequestMapping(value="/adminListPage.do", produces = "application/json; charset=utf-8")
	public Map selectList(@RequestParam(defaultValue="1") int curPage, BuylistviewVO buylistviewvo, String startDate, String endDate) {
		Map map = new HashMap();
		Map result = new HashMap();
		
		List<BuylistviewVO> salesList = adminService.getSalesList(buylistviewvo);
		System.out.println("확인1 : "+ salesList.get(0).getBuylistDate());
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		salesList = adminService.getSearchDate(map);
		
		for(int i=0; i<salesList.size(); i++) {
			salesList.get(i).setBuylistDate(salesList.get(i).getBuylistDate().substring(0,10));	
		}
		
		PaginationVO paginationVO = new PaginationVO(salesList.size(), curPage);
		map.put("startRow", paginationVO.getStartIndex()+1);
		map.put("endRow", paginationVO.getStartIndex()+paginationVO.getPageSize());
		salesList = adminService.selectFindBoardWithPaging(map);
		
		result.put("pagination", paginationVO);
		result.put("salesList", salesList);
		result.put("salesListSize", salesList.size());
		
		return result;	
	}
	
//	@RequestMapping("/datesearch.do")
//	public ModelAndView selectDate(BuylistviewVO buylistviewvo, String startDate, String endDate) {
//		ModelAndView mv = new ModelAndView();
//		Map map = new HashMap();
//		map.put("startDate", startDate);
//		map.put("endDate", endDate);
//		
//		List<BuylistviewVO> salesList = adminService.getSearchDate(map);
//		
//		for(int i=0; i<salesList.size(); i++) {
//			salesList.get(i).setBuylistDate(salesList.get(i).getBuylistDate().substring(0,10));	
//		}
//		
//		mv.addObject("salesList", salesList);
//		mv.setViewName("adminPage");
//		
//		return mv;
//		
//	}
	
//	@RequestMapping("/adminListPage.do")
//	public ModelAndView selectList(BuylistviewVO buylistviewvo) {
//		ModelAndView mv = new ModelAndView();
//		List<BuylistviewVO> salesList = adminService.getSalesList(buylistviewvo);
//		
//		for(int i=0; i<salesList.size(); i++) {
//			salesList.get(i).setBuylistDate(salesList.get(i).getBuylistDate().substring(0,10));	
//		}
//		
//		mv.addObject("salesList", salesList);
//		mv.setViewName("adminPage"); 
//	
//		return mv;	
//	}
//	
//	@RequestMapping("/datesearch.do")
//	public ModelAndView selectDate(BuylistviewVO buylistviewvo, String startDate, String endDate) {
//		ModelAndView mv = new ModelAndView();
//		Map map = new HashMap();
//		map.put("startDate", startDate);
//		map.put("endDate", endDate);
//		
//		List<BuylistviewVO> salesList = adminService.getSearchDate(map);
//		
//		for(int i=0; i<salesList.size(); i++) {
//			salesList.get(i).setBuylistDate(salesList.get(i).getBuylistDate().substring(0,10));	
//		}
//		
//		mv.addObject("salesList", salesList);
//		mv.setViewName("adminPage");
//		
//		return mv;
//		
//	}
}

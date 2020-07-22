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

import com.mycompany.domain.PaginationVO;
import com.mycompany.domain.ShopVO;
import com.mycompany.service.ShopServiceImpl;

@Controller
public class ShopController {
	
	@Autowired
	public ShopServiceImpl shopService;
	
	// 검색, 태그분류, 페이지네이션 기능
	@ResponseBody
	@RequestMapping(value="/shopCategory.do", produces = "application/json; charset=utf-8")
	public Map shopListCategory(@RequestParam(defaultValue="1") int curPage, String tagCategory, ShopVO vo) {
//		System.out.println("컨트롤러 연결 ok");
		Map result = new HashMap();
		Map searchMap = new HashMap(); 
		searchMap.put("tagCategory", tagCategory);
		List<ShopVO> shopList =shopService.selectShopCategoryList(searchMap);
//		System.out.println("서치한 리스트"+shopList);
		PaginationVO paginationVO = new PaginationVO(shopList.size(), curPage);
		searchMap.put("startRow", paginationVO.getStartIndex()+1);
		searchMap.put("endRow", paginationVO.getStartIndex()+paginationVO.getPageSize());
		
		shopList = shopService.selectShopByTagWithPaging(searchMap);
		result.put("pagination", paginationVO);
		result.put("shopList", shopList);
		result.put("shopListSize", shopList.size());
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/shopAutoCompleteSearch.do", produces = "application/json; charset=utf-8")
	public Map shopListCategory(String searchSomething, ShopVO vo) {
		System.out.println("컨트롤 단 옴");
		Map searchKeyWord = new HashMap();
		Map result = new HashMap();
		searchKeyWord.put("searchSomething", searchSomething);
		
		List<ShopVO> searchList = shopService.selectSearchKeyWordList(searchKeyWord);
//		System.out.println(searchList);
		for(ShopVO i : searchList) {
			System.out.println(i.getShopProductname());
		}
		result.put("searchList", searchList);
		return result;
	}
}

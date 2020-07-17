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
	
	//전체 쇼핑몰 품목 가져오기
	@RequestMapping(value="/shop.do")
	public ModelAndView shopListAll() {
		ModelAndView mv = new ModelAndView();
		List<ShopVO> shopList = shopService.selectShopAll();
		mv.addObject("shopList", shopList);
		mv.setViewName("/shop");
		return mv;
	}
	// 카테고리 별 쇼핑몰 품목 가져오기
//	@ResponseBody
//	@RequestMapping(value="/shopCategory.do")
//	public ModelAndView shopListCategory(@RequestParam(value = "tagCategory") String tagCategory, ShopVO vo) {
//		System.out.println("ok");
//		
//		ModelAndView mv = new ModelAndView();
//		vo.setShopCategory(tagCategory);
//		vo.setShopName(tagCategory);
//		List<ShopVO> shopList =shopService.selectShopCategory(vo);
//		
//		mv.addObject("shops", shopList);
//		mv.setViewName("/shop");
//		return mv;
//	}
	@ResponseBody
	@RequestMapping(value="/shopCategory.do", produces = "application/json; charset=utf-8")
	public Map shopListCategory(@RequestParam(defaultValue="1") int curPage, @RequestParam(value = "tagCategory") String tagCategory, ShopVO vo) {
		System.out.println("ok");
		Map result = new HashMap();
		int listCnt = shopService.selectShopCntByTag(tagCategory);
		PaginationVO paginationVO = new PaginationVO(listCnt, curPage);
		Map searchListMap = new HashMap();
		searchListMap.put("tagCategory", tagCategory);
		searchListMap.put("startRow", paginationVO.getStartIndex()+1);
		searchListMap.put("endRow", paginationVO.getStartIndex()+paginationVO.getPageSize());
		List<ShopVO> shopList = shopService.selectShopByTagWithPaging(searchListMap);
		System.out.println("shopList"+shopList);
		System.out.println("listCnt"+listCnt);
		result.put("pagination", paginationVO);
		result.put("shopList", shopList);
		result.put("shopListSize", shopList.size());
		return result;
	}

	// 품목 페이징

}

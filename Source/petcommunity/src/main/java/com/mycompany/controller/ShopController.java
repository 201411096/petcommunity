package com.mycompany.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
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
		mv.addObject("shops", shopList);
		mv.setViewName("/shop");
		return mv;
	}
	// 카테고리 별 쇼핑몰 품목 가져오기
	@RequestMapping(value="/shopCategory.do")
	public ModelAndView shopListCategory(@RequestParam(value = "shopCategory") String shopCategory, ShopVO vo) {
		ModelAndView mv = new ModelAndView();
		vo.setShopCategory(shopCategory);
		List<ShopVO> shopList =shopService.selectShopCategory(vo);
		System.out.println(shopList);
		mv.addObject("shops", shopList);
		mv.setViewName("/shop");
		return mv;
	}
	// 쇼핑몰별 품목 가져오기
	@RequestMapping(value="/shopName.do")
	public ModelAndView shopListName(@RequestParam(value = "shopName") String shopName, ShopVO vo) {
		ModelAndView mv = new ModelAndView();
		vo.setShopName(shopName);
		List<ShopVO> shopList =shopService.selectShopName(vo);
		System.out.println(shopList);
		mv.addObject("shops", shopList);
		mv.setViewName("/shop");
		return mv;
	}
}

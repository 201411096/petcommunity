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
	
	@RequestMapping(value="/shopAll.do")
	public ModelAndView shopListAll() {
		ModelAndView mv = new ModelAndView();
		List<ShopVO> shopList = shopService.selectShopAll();
		
		System.out.println("프린트"+ shopList);
		mv.addObject("shops", shopList);
		mv.setViewName("/shop");
		return mv;
	}
//	@RequestMapping(value="/shop.do")
//	public ModelAndView shopListName(@RequestParam(value = "shopName") String shopName, @RequestParam(value = "shopCategory") String shopCategory, ShopVO vo) {
//		ModelAndView mv = new ModelAndView();
//		vo.setShopName(shopName);
//		vo.setShopCategory(shopCategory);
//		List<ShopVO> shopList =shopService.selectShop(vo);
//		mv.addObject("shopList", shopList);
//		mv.setViewName("/shop.do");
//		return mv;
//	}
}

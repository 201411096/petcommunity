//package com.mycompany.controller;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.servlet.ModelAndView;
//import com.mycompany.domain.ShopVO;
//import com.mycompany.service.ShopService;
//
//@Controller
//public class ShopController {
//	
//	@Autowired
//	public ShopService shopService;
//	
//	@RequestMapping(value="/shop.do")
//	public ModelAndView shopList(ShopVO vo) {
//		ModelAndView mv = new ModelAndView();
//		List<ShopVO> shopList =shopService.selectShop(vo);
//		mv.addObject("shopList", shopList);
//		mv.setViewName("/shop.do");
//		return mv;
//	}
//}

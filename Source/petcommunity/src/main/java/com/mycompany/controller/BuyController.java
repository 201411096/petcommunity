package com.mycompany.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.service.BuyService;

@Controller
public class BuyController {

	@Autowired
	private BuyService buyService;

	/* 
	    * 함수 이름 : buyReceipt
	    * 주요 기능 : 주문내역 상세페이지
	    * 함수 내용 : 이전 페이지에서 주문번호를 넘겨받아서 product와 member의 정보를 가져옴
	    */
	@RequestMapping(value = "buyReceipt.do")
	public ModelAndView buyReceipt(String buy) {
		ModelAndView mv = new ModelAndView();
		/* ArrayList<String> list2 = new ArrayList<>(); */
		List<Map<String, String>> buyList = buyService.buyReceipt(buy);

		mv.addObject("buyReceipt", buyList);
		mv.setViewName("buyReceipt");
		return mv;
	}
}

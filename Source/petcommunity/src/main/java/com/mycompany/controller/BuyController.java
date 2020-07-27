package com.mycompany.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.service.BuyService;

@Controller
public class BuyController {

	@Autowired
	private BuyService buyService;
	
	
	@RequestMapping(value="buyReceipt.do")
	public ModelAndView buyReceipt(String buy) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("buyReceipt",buyService.buyReceipt(buy));
		mv.setViewName("buyReceipt");
		return mv;
	}
}

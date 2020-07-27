package com.mycompany.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.domain.ProductVO;
import com.mycompany.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	/*
	 * @RequestMapping("/admin.do") public ModelAndView getSalesList(ProductVO
	 * productvo) { ModelAndView mv = new ModelAndView();
	 * 
	 * mv.setViewName("redirect:/adminListPage.do");
	 * 
	 * return mv;
	 * 
	 * }
	 */
	@RequestMapping("/adminListPage.do")
	public ModelAndView selectList() {
		ModelAndView mv = new ModelAndView();
		
		List<ProductVO> productvoList = adminService.getSalesList();
		
		mv.addObject("productvoList", productvoList);
		mv.setViewName("adminPage"); 
		return mv;
		
	}
}

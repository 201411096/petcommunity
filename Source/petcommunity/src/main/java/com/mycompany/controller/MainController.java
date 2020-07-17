package com.mycompany.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {

	// 메인페이지 연결
	@RequestMapping("main.do")
	public ModelAndView moveToMain(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/main");
		return mv;
	}
	
	// 동물병원찾기 페이지 이동
	@RequestMapping("hospital.do")
	public ModelAndView moveToHospital(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/hospital");
		return mv;
	}
	
	// 실종신고 페이지 이동
	@RequestMapping("find.do")
	public ModelAndView moveToFindBoard(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/findboardlist");
		return mv;
	}
	
	// 커뮤니티 페이지 이동
	@RequestMapping("community.do")
	public ModelAndView moveToCommunity(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/communityBoardList");
		return mv;
	}
}

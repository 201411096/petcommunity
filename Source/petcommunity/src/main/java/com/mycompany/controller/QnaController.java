package com.mycompany.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class QnaController {
	
	// 고객센터 페이지 이동
	@RequestMapping("/cs.do")
	public ModelAndView moveToQna(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("qna");
		return mv;
	}
	
}

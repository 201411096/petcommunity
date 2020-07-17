package com.mycompany.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.domain.MemberVO;
import com.mycompany.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	public MemberService memberService;
	
	@RequestMapping(value = "/signup2.do")
	public ModelAndView signup(MemberVO vo) {
		int a=memberService.signup(vo);
		System.out.println(a);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login");
		return mv;
		
	}
	
	
	
}

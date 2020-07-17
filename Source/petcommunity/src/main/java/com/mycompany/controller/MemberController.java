package com.mycompany.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.domain.MemberVO;
import com.mycompany.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	public MemberService memberService;
	
	@RequestMapping(value = "/signup2.do")
	public ModelAndView signup(MemberVO vo) {
		memberService.signup(vo);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login");
		return mv;
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/checkid.do",produces = "application/text; charset=utf-8")
	public String checkid(MemberVO vo) {
		String result = "사용가능한 ID입니다.";
		int checkvo= memberService.idcheck(vo);

		if(checkvo > 0) {
			result = "이미 사용중인 아이디입니다";
		}	
		return result;
	}
	
	@RequestMapping(value="/sign.do", method = RequestMethod.POST)
	public ModelAndView signin(MemberVO vo , HttpServletRequest req) {
		HttpSession session = req.getSession();
		ModelAndView mv = new ModelAndView();
		
		MemberVO result=memberService.signin(vo);
		session.setAttribute("memberVO",result);
		
		/* mv.addObject("member",session); */
		mv.setViewName("header");
		
		return mv;
		
	}
	
	@RequestMapping(value="logout.do")
	public ModelAndView logout(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = req.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		mv.setViewName("header");
		return mv;
		
	}

	
}

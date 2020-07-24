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
	private MemberService memberService;
	
	/* 
	    * 함수 이름 : signup
	    * 주요 기능 : 회원가입 등록 하는 페이지
	    * 함수 내용 : 회원가입 폼에서 입력한 데이터를 받아서 DB에 저장하고 로그인페이지로 연결
	    */
	@RequestMapping(value = "/signup2.do")
	public ModelAndView signup(MemberVO vo) {
		memberService.signup(vo);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login");
		return mv;
		
	}
	
	

	/* 
	    * 함수 이름 : checkid
	    * 주요 기능 : 회원가입시 아이디 사용여부 체크
	    * 함수 내용 : 아이디 입력 받은 데이터를 받아서 DB에서 중복되는 값이 있는지 체크하고 
	    * 		     중복되는 아이디가 있다면 1 -> 이미 사용중인 아이디
	    * 		     중복되는 아이디가 없다면 0 -> 사용가능한 ID입니다 를 return 해줌  
	    */
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
	
	
	/* 
	    * 함수 이름 : signin
	    * 주요 기능 : 로그인 하는 페이지
	    * 함수 내용 : 입력받은 아이디와 비밀번호 데이터로 DB에서 확인후 
	    * 		     받아오는 값이 있다면 세션에 memberVO를 저장. 
	    * 		     없다면 다시 로그인 페이지로 연결
	    */
	@RequestMapping(value="/sign.do", method = RequestMethod.POST)
	public ModelAndView signin(MemberVO vo , HttpServletRequest req) {
		HttpSession session = req.getSession();
		ModelAndView mv = new ModelAndView();
		
		MemberVO result=memberService.signin(vo);
		if(result != null) {
		session.setAttribute("memberVO",result);
		mv.setViewName("header");
		return mv;
		}
		
		else {
			mv.addObject("msg","test");
			mv.setViewName("login");
			return mv;
		}
	}
	
	
	/* 
	    * 함수 이름 : logout
	    * 주요 기능 : 로그아웃 하는 페이지
	    * 함수 내용 : 로그아웃 버튼클릭시 해당 member에 저장된 세션을 삭제후 main으로 이동.
	    */
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

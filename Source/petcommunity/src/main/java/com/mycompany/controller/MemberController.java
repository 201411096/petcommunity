package com.mycompany.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;

import java.util.HashMap;
import java.util.Map;

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
import com.mycompany.util.SendMail;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;

	/*
	 * 함수 이름 : signup 주요 기능 : 회원가입 등록 하는 페이지 함수 내용 : 회원가입 폼에서 입력한 데이터를 받아서 DB에 저장하고
	 * 로그인페이지로 연결
	 */
	@RequestMapping(value = "/signup2.do")
	public ModelAndView signup(MemberVO vo) {
		memberService.signup(vo);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login");
		return mv;

	}

	/*
	 * 함수 이름 : checkid 주요 기능 : 회원가입시 아이디 사용여부 체크 함수 내용 : 아이디 입력 받은 데이터를 받아서 DB에서
	 * 중복되는 값이 있는지 체크하고 중복되는 아이디가 있다면 1 -> 이미 사용중인 아이디 중복되는 아이디가 없다면 0 -> 사용가능한
	 * ID입니다 를 return 해줌
	 */
	@ResponseBody
	@RequestMapping(value = "/checkid.do", produces = "application/text; charset=utf-8")
	public String checkid(MemberVO vo) {
		String result = "사용가능한 ID입니다.";
		int checkvo = memberService.idcheck(vo);

		if (checkvo > 0) {
			result = "이미 사용중인 아이디입니다";
		}
		return result;
	}

	/*
	 * 함수 이름 : signin 주요 기능 : 로그인 하는 페이지 함수 내용 : 입력받은 아이디와 비밀번호 데이터로 DB에서 확인후 받아오는
	 * 값이 있다면 세션에 memberVO를 저장. 없다면 다시 로그인 페이지로 연결
	 */
	@RequestMapping(value = "/sign.do", method = RequestMethod.POST)
	public ModelAndView signin(MemberVO vo, HttpServletRequest req) {
		HttpSession session = req.getSession();
		ModelAndView mv = new ModelAndView();

		MemberVO result = memberService.signin(vo);
		if (result != null) {
			// ----------------------------------------------------------------
			// 모바일로 웹 접속 시 따른 token값 세션에 추가
			// ----------------------------------------------------------------
			// 세션"deviceToken"에 저장해놓은 토큰 값을 "memberVO"세션 및 DB에 memberToken 값 넣기
			String tokenCheck = (String) session.getAttribute("deviceToken");
			if (tokenCheck != null) {
				result.setMemberToken(tokenCheck);
				session.setAttribute("memberVO", result);
				memberService.tokenInsert(result);
			}
			// ----------------------------------------------------------------
			// ----------------------------------------------------------------
			session.setAttribute("memberVO", result);
			result.getMemberId();
			mv.setViewName("main");
			return mv;
		}

		else {
			mv.addObject("msg", "test");
			mv.setViewName("login");
			return mv;
		}
	}

	/*
	 * 함수 이름 : logout 주요 기능 : 로그아웃 하는 페이지 함수 내용 : 로그아웃 버튼클릭시 해당 member에 저장된 세션을 삭제후
	 * main으로 이동.
	 */
	@RequestMapping(value = "logout.do")
	public ModelAndView logout(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = req.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		mv.setViewName("header");
		return mv;

	}

	/*
	 * 함수 이름 : DeviceTokenInsert 주요 기능 : 디바이스 토큰 저장 함수 내용 : 앱으로 들어왔을 경우 DB에 Token을
	 * 저장 후 index페이지로 이동.
	 */
	@RequestMapping(value = "/test_token.do")
	public String pushAlarm(String tokenId, HttpServletRequest req) {
		HttpSession session = req.getSession();
		// 세션에 토큰 값 저장
		session.setAttribute("deviceToken", tokenId);
		System.out.println("토큰테스트" + tokenId);

//	      ModelAndView mv = new ModelAndView();
//	      mv.addObject("tokenId",tokenId);
//	      mv.setViewName("test_token");
//	      return mv;
		return "redirect:/test_kys.jsp";
	}

	@ResponseBody
	@RequestMapping(value = "/memberUpdate1.do", produces = "application/json; charset=utf-8")
	public Map memberUpdate1(HttpServletRequest req) {
		Map result = new HashMap();
		HttpSession session = req.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("memberVO");
		String id = mvo.getMemberId();

		MemberVO list = memberService.memberList(id);
		result.put("list", list);
		return result;
	}

	@RequestMapping(value = "/memberUpdate.do")
	public String memberUpdate(MemberVO vo) {
		System.out.println(vo.getMemberId());
		memberService.updateMember(vo);

		return "redirect:/mypageAnimal.do";
	}

	@ResponseBody
	@RequestMapping(value = "/findMember.do", produces = "application/text; charset=utf-8")
	public String findMemberId(MemberVO vo) {
		String result = "이메일로 아이디 정보를 보내드렸습니다";

		MemberVO rs = memberService.findMemberId(vo);
		if (rs == null) {
			System.out.println("오류 발생");
			result = "가입 정보가 없습니다";

		} else {
			SendMail.sendMail(rs.getMemberEmail(), "okidoghere 아이디찾기 결과입니다.",rs.getMemberName() + "님의 ID는" + rs.getMemberId() + "입니다");
		}

		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/findMemberPass.do", produces = "application/text; charset=utf-8")
	public String findMemberPassword(MemberVO vo) {
		String result = "이메일로 임시 비밀번호를 보내드렸습니다";

		String[] alphabetAndNumber = { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P",
				"Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
				"0" };
		String tempPassword = "";
		for (int i = 0; i < 10; i++) {
			int tempIdx = (int) (Math.random() * 36);
			tempPassword += alphabetAndNumber[tempIdx];
		}

		vo.setMemberPassword(tempPassword);
		System.out.println(vo.getMemberId());
		System.out.println(vo.getMemberEmail());
		System.out.println(vo.getMemberPassword());
		SendMail.sendMail(vo.getMemberEmail(), "okidoghere 비밀번호 찾기 결과입니다", "임시 비밀번호는" + tempPassword + "입니다");
		int rs = memberService.makeTemporaryPassword(vo);
		if (rs == 0) {
			System.out.println("오류 발생");
			result = "가입 정보가 없습니다";

		}

		return result;
	}

}

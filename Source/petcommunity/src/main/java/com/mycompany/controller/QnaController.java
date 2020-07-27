package com.mycompany.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.mycompany.domain.FindBoardVO;
import com.mycompany.domain.MemberVO;
import com.mycompany.domain.PaginationVO;
import com.mycompany.domain.QnaVO;
import com.mycompany.service.MemberService;
import com.mycompany.service.QnaService;

@Controller
public class QnaController {

	@Autowired
	private QnaService qnaService;

	/* 
    * 함수 이름 : getQnaBoardList
    * 주요 기능 : 게시판 페이지 이동
    * 함수 내용 : 
    */	
	@RequestMapping(value="/cs.do")
	public ModelAndView getQnaBoardList() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("qnaBoardList");
		
		return mv;
	}
	
	/* 
    * 함수 이름 : getQnaBoardWrite
    * 주요 기능 : 게시판 작성페이지 이동
    * 함수 내용 : 로그인 안 되어있는 경우 로그인 페이지 이동, 아닐경우 작성페이지 이동
    */
	@RequestMapping("/write.do")
	public ModelAndView getQnaBoardWrite(QnaVO qnavo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		if (session.getAttribute("memberVO") == null) {
			mv.setViewName("login");
		} else {
			mv.setViewName("qnaBoardWrite");
		}
		return mv;
	}

	/* 
    * 함수 이름 : insertQnaBoard
    * 주요 기능 : 작성한 글 입력, 목록 페이지 이동 
    * 함수 내용 : 로그인의 경우 아이디 세팅, 로그인이 안 되어 있는 경우 메인페이지로 이동
    */
	@ResponseBody
	@RequestMapping(value = "/writeIntoQna.do", produces = "application/text; charset=utf-8")
	public String insertQnaBoard(QnaVO qnavo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("memberVO") != null) {
			qnavo.setMemberId(((MemberVO) session.getAttribute("memberVO")).getMemberId());
		} else if (session.getAttribute("memberVO") == null) {
			mv.setViewName("main");
		}
		mv.setViewName("qnaBoardWrite");
		qnaService.insertQnaBoard(qnavo);
		return "redirect:/qnaList.do";
	}

	/* 
    * 함수 이름 : selectQnaBoardList
    * 주요 기능 : 게시판 목록 이동
    * 함수 내용 : 연결된 계정 아이디 얻어옴
    */
	@RequestMapping(value="qnaList.do", produces = "application/json; charset=utf-8")
	public ModelAndView selectQnaBoardList(@RequestParam(defaultValue="1") int curPage,QnaVO qnavo, String searchType, HttpSession session) {
			ModelAndView mv = new ModelAndView();
			Map map = new HashMap();
			
			MemberVO membervo= (MemberVO)session.getAttribute("memberVO");
			List<QnaVO> qnavoList = qnaService.getQnaBoardList(qnavo);
			
			PaginationVO paginationVO = new PaginationVO(qnavoList.size(), curPage);
			map.put("startRow", paginationVO.getStartIndex()+1);
			paginationVO.setPageSize(9);
			map.put("endRow", paginationVO.getStartIndex()+paginationVO.getPageSize());
			qnavoList = qnaService.selectFindBoardWithPaging(map);

			mv.addObject("pagination", paginationVO);
			mv.addObject("qnavoList", qnavoList);
			mv.addObject("qnavoListSize",qnavoList.size());
			mv.addObject("membervo", membervo);
		return mv;
	}
	
	/* 
    * 함수 이름 : getQnaBoardContent
    * 주요 기능 : 게시판 상세페이지 이동
    * 함수 내용 : 비로그인, 로그인, 관리자 구별하여 상세페이지 이동
    */
	@RequestMapping("qnaContent.do")
	public ModelAndView getQnaBoardContent(QnaVO qnavo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		qnavo=qnaService.getQnaBoardContent(qnavo);
		MemberVO membervo=(MemberVO)session.getAttribute("memberVO");
		
		if(membervo==null) {
			qnaService.updateReadcount(qnavo);
			mv.setViewName("qnaBoardContent");
			mv.addObject("qnaContent", qnaService.getQnaBoardContent(qnavo));
			
		}else if(membervo.getMemberFlag().equals("0")) {
			qnaService.updateReadcount(qnavo);
			mv.setViewName("qnaBoardContent");
			mv.addObject("qnaContent", qnaService.getQnaBoardContent(qnavo));
			
		}else if(membervo.getMemberFlag().equals("1")) {
			qnaService.updateReadcount(qnavo);
			String admin=((MemberVO)session.getAttribute("memberVO")).getMemberFlag();
			List<QnaVO> listQna= qnaService.selectListRe(qnavo);
			mv.setViewName("qnaBoardContent");
			mv.addObject("qnaContent", qnaService.getQnaBoardContent(qnavo));
			mv.addObject("admin",admin);
			int groupListSize = listQna.size();
			mv.addObject("groupListSize", groupListSize);
		}
		
		return mv;
	}

	/* 
    * 함수 이름 : getQnaBoardModify
    * 주요 기능 : 게시글 수정페이지 이동
    * 함수 내용 : 연결된 아이디와 작성글 아이디가 일치하는 경우만 수정페이지 이동
    */
	@RequestMapping(value = "qnaModify.do", produces = "application/text; charset=utf-8")
	public ModelAndView QnaBoardModify(QnaVO qnavo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		qnavo=qnaService.getQnaBoardContent(qnavo);
		MemberVO membervo=(MemberVO)session.getAttribute("memberVO");
		
		if (membervo == null) {
			mv.setViewName("login");

		} else if (membervo.getMemberId().equals(qnavo.getMemberId())) {
			mv.setViewName("qnaBoardModify");
			mv.addObject("qnaContent", qnaService.getQnaBoardContent(qnavo));

		} else { 
			mv.setViewName("main");
		}
		return mv;
	}

	/* 
    * 함수 이름 : qnaBoardModify
    * 주요 기능 : 게시글 수정 후 목록페이지 이동
    * 함수 내용 : 수정내용 있으면 목록이동, 없으면 메인페이지 이동 
    */
	@RequestMapping("modify.do")
	public String qnaBoardModify(QnaVO qnavo) {

		int result = qnaService.updateQna(qnavo);
		if (result != 0) {
			return "redirect:/qnaList.do";
		}
		return "main.do";
	}

		/* 
	    * 함수 이름 : deleteQnaBoard
	    * 주요 기능 : 게시글 삭제 후 목록페이지 이동
	    * 함수 내용 : 연결된 계정과 작성글의 아이디가 일치하는 경우만 삭제
	    */
	@RequestMapping(value ="delete.do", produces = "application/text; charset=utf-8")
	public ModelAndView deleteQnaBoard(QnaVO qnavo, HttpSession session) {
		
		ModelAndView mv = new ModelAndView();
		MemberVO membervo = (MemberVO) session.getAttribute("memberVO");
		qnavo=qnaService.getQnaBoardContent(qnavo);
		String id = qnavo.getMemberId();
		
		if (membervo == null) {
			mv.setViewName("redirect:/login.do"); 
		} else if ((membervo.getMemberId().equals(id) || (membervo).getMemberFlag().equals("1"))) {
			qnaService.deleteQnaBoard(qnavo);
			mv.setViewName("redirect:/qnaList.do");
		} else {
			mv.setViewName("redirect:/main.do");
		}return mv;
	}
		
		/* 
	    * 함수 이름 : selectKeyword
	    * 주요 기능 : 검색버튼 눌렀을 때 입력한 키워드와 일치하는 db정보 출력, 페이징처리
	    * 함수 내용 : 
	    */
		@RequestMapping(value="qnaBoardListPaging.do", produces = "application/json; charset=utf-8") //페이징 같이
		public ModelAndView selectKeyword(@RequestParam(defaultValue="1") int curPage,QnaVO qnavo, String searchType, String keyword) {
			Map map = new HashMap();
			Map result = new HashMap();
			ModelAndView mv = new ModelAndView();
			map.put("searchType", searchType);
			map.put("keyword", keyword);
			List<QnaVO> qnavoList = qnaService.selectKeyword(map);
			
			PaginationVO paginationVO = new PaginationVO(qnavoList.size(), curPage);
			map.put("startRow", paginationVO.getStartIndex()+1);
			map.put("endRow", paginationVO.getStartIndex()+paginationVO.getPageSize());
					
			qnavoList = qnaService.selectFindBoardWithPaging(map);
			
			result.put("pagination", paginationVO);
			mv.addObject("qnavoList", qnavoList);
			mv.setViewName("/qnaBoardList");
			
			return mv;
		}
		
		/* 
	    * 함수 이름 : getReplyQnaBoard
	    * 주요 기능 : 답변하기 버튼 눌렀을 때 답변페이지 이동
	    * 함수 내용 : 작성글 그룹아이디 출력 
	    */
		@RequestMapping("reply.do")
		public ModelAndView getReplyQnaBoard(QnaVO qnavo) {
			ModelAndView mv = new ModelAndView();
			qnavo=qnaService.selectGroupId(qnavo);
			mv.addObject("qnaReplyContent", qnavo);
			mv.setViewName("qnaReplyBoardWrite");
			
			return mv;
		}
		
		/* 
	    * 함수 이름 : qnaBoardReplyWrite
	    * 주요 기능 : 답변 버튼 눌렀을 때 목록페이지 이동
	    * 함수 내용 : 연결된 아이디 세팅
	    */
		@RequestMapping("replyWrite.do")
		public ModelAndView insertReply(QnaVO qnavo, HttpSession session) {
			ModelAndView mv = new ModelAndView();
			qnavo.getQuestionboardContent();
			String re = "RE : ";
			qnavo.setQuestionboardTitle(re+qnavo.getQuestionboardTitle());
			qnavo.setMemberId(((MemberVO)session.getAttribute("memberVO")).getMemberId());
			qnaService.insertReply(qnavo);
			mv.setViewName("redirect:/qnaList.do");
			
			return mv;
		}
		
}

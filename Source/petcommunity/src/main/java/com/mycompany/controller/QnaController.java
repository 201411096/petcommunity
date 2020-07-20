package com.mycompany.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.domain.MemberVO;
import com.mycompany.domain.QnaVO;
import com.mycompany.service.QnaService;

@Controller
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	
	// 고객센터 페이지 이동
	@RequestMapping("/cs.do")
	public ModelAndView getQnaPage(QnaVO qnavo){
		ModelAndView mv = new ModelAndView();
		
		List<QnaVO> qnavoList = qnaService.selectQnaList(qnavo);
		mv.setViewName("/qnaList");
		mv.addObject("qnavoList", qnavoList);
		
		return mv;
	}
	
	// 글쓰기 페이지 이동
	@RequestMapping("/qnaWrite.do")
	public ModelAndView getQnaWrite(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("qnaWrite");
		return mv;
	}
	
	// 글 입력 (조건 : 회원)
	@RequestMapping(value="/writeIntoQna.do", produces = "application/text; charset=utf-8")
	public String insertQna(QnaVO qnavo, HttpSession session ) {
		
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("memberVO")!=null) {
			qnavo.setMemberId(((MemberVO)session.getAttribute("memberVO")).getMemberId());
		}else if(session.getAttribute("memberVO")==null) {
			mv.setViewName("main");
		}
		qnaService.insertQna(qnavo);
		return "redirect:/qnaList.do";	
	}
	
	// 글 입력 후 리스트에서 출력
	@RequestMapping("qnaList.do")
	public ModelAndView selectQnaList(QnaVO qnavo) {
		ModelAndView mv = new ModelAndView();
		List<QnaVO> qnavoList = qnaService.selectQnaList(qnavo);
		mv.setViewName("/qnaList");
		mv.addObject("qnavoList", qnavoList);
		
		return mv;
	}
	
	// 게시글 상세보기 출력(조건 : 아이디)
	@RequestMapping("qnaContent.do")
	public ModelAndView idCheck(QnaVO qnavo) {
		System.out.println("출력:"+qnavo.getQuestionboardContent());
		ModelAndView mv = new ModelAndView();
		QnaVO result = qnaService.selectOne(qnavo);
		if(result!=null) {
			mv.addObject("qnavo");
			mv.setViewName("qnaList");
		}
		return mv;
	}
	
	
	// 게시글 수정
	// 게시글 삭제
	
}

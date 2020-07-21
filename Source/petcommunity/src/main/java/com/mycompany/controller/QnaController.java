package com.mycompany.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.domain.MemberVO;
import com.mycompany.domain.QnaVO;
import com.mycompany.service.MemberService;
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
	
	// 글쓰기 페이지 이동 (조건 : 로그인시 이동)
	@RequestMapping("/write.do")
	public ModelAndView getQnaWrite(QnaVO qnavo, HttpSession session){
		ModelAndView mv = new ModelAndView();
		System.out.println("getQnaWrite 확인 : " + session.getAttribute("memberVO"));
		if(session.getAttribute("memberVO")==null) {
			mv.setViewName("login");
		}else {
			mv.setViewName("qnaWrite");
		}
		return mv;
	}
	
	// 글 입력
	@RequestMapping(value="/writeIntoQna.do", produces = "application/text; charset=utf-8")
	public String insertQna(QnaVO qnavo, HttpSession session ) {
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("memberVO")!=null) {
			qnavo.setMemberId(((MemberVO)session.getAttribute("memberVO")).getMemberId());
		}else if(session.getAttribute("memberVO")==null) {
			mv.setViewName("main");
		}
		mv.setViewName("qnaWrite");
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
	
	// 게시글 상세보기 출력
	@RequestMapping("qnaContent.do")
	public ModelAndView getQnaBoard(QnaVO qnavo) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("qnaContent", qnaService.selectOne(qnavo));
			
		return mv;
	}
	
	// 게시글 수정페이지 이동하기 (조건 : 아이디 일치하면 페이지 이동)
	@RequestMapping(value="qnaModify.do", produces = "application/text; charset=utf-8")
	public ModelAndView modifyform(QnaVO qnavo, HttpSession session) {
		// 동일아이디 조건 (매퍼) 로그인된 아이디(session) == 작성된 아이디(qnavo.id)
//		System.out.println("modifyform ID확인1:"+((MemberVO)session.getAttribute("memberVO")).getMemberId());
		System.out.println("modifyform ID확인2:"+qnavo.getMemberId());
		ModelAndView mv = new ModelAndView();
		
		if(session.getAttribute("memberVO")==null){//로그인x 경우
			mv.setViewName("login");
			
		} else if(((MemberVO)session.getAttribute("memberVO")).getMemberId().equals(qnavo.getMemberId())){ //작성글id == id 경우
			mv.setViewName("qnaModify");
			mv.addObject("qnaContent", qnaService.selectOne(qnavo));
			
		} else{ // 작성 글 아이디 != 아이디  경우
			mv.setViewName("main");
		}
		return mv;
	}
	
	// 수정한 게시글 저장
	@RequestMapping("modify.do")
	public String modifyQna(QnaVO qnavo) {
		System.out.println("modifyQna 확인(글번호) :"+qnavo.getQuestionboardId());
		int result = qnaService.updateQna(qnavo);
		if(result!=0) {
			return "redirect:/qnaList.do";
		}
			return "main.do";
	}
	
	// 게시글 삭제
	
}

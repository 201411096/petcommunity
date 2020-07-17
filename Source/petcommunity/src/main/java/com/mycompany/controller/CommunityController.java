package com.mycompany.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.domain.CommunityVO;
import com.mycompany.service.CommunityService;

@Controller
public class CommunityController {
	
	@Autowired
	private CommunityService communityService;
	
	//게시판 목록보기 페이지로 넘겨준다
	@RequestMapping("/communityBoardList.do")
	public ModelAndView getCommunityBoardList(CommunityVO vo, ModelAndView mv) {
		List<CommunityVO> communityBoardList = communityService.getBoardList();
		mv.addObject("communityBoardList", communityBoardList);
		mv.setViewName("communityBoardList"); 
		return mv;
	}
	
	
	//게시판 쓰기 페이지로 넘겨준다
	@RequestMapping("/communityBoardWrite.do")
	public String getCommunityBoardwrite() {
		return "communityBoardWrite";
	}
	
	//쓰기 완료 후 boardList로 되돌아가기
	@RequestMapping("/writeIntoBoard.do")
	public String writeIntoBoard(CommunityVO vo, HttpServletRequest request, HttpSession session, ModelAndView mv ) {
		communityService.writeIntoBoard(vo);
		return "redirect:communityBoardList.do";
	}
	
	//게시판 내용 가져오기
	@RequestMapping("/getBoardContent.do")
	public ModelAndView getBoardContent(CommunityVO vo, HttpServletRequest request, ModelAndView mv ) {
		//parameter로 넘어온 글번호를 vo에 셋해준후 Mapper로 넘겨줌
		String communityboardId = request.getParameter("communityboardId");
		vo.setCommunityboardId(communityboardId);
		
		mv.addObject("boardContent", communityService.getBoardContent(vo));
		mv.setViewName("communityBoardContent"); 
		return mv;
	}
	
	
	
}

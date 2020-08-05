package com.mycompany.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.domain.CommunityVO;
import com.mycompany.domain.FindBoardVO;
import com.mycompany.domain.LostBoardVO;
import com.mycompany.domain.QnaVO;
import com.mycompany.service.MainService;
 
@Controller
public class MainController {
	
	@Autowired
	private MainService mainService;

	// 메인페이지 연결
	@RequestMapping("main.do")
	public ModelAndView moveToMain(){
		ModelAndView mv = new ModelAndView();
		
		// 실종
		List<LostBoardVO> lostBoardvo = mainService.getLostBoardList();
		System.out.println("getLostBoardList"+ lostBoardvo.size());
		mv.addObject("lostBoardvo", lostBoardvo);
		// 발견
		List<FindBoardVO> FindBoardvo = mainService.getFindBoardList();
		mv.addObject("FindBoardvo", FindBoardvo);
		// 커뮤니티
		List<CommunityVO> CommunityBoardvo = mainService.getCommunityBoardList();
		mv.addObject("CommunityBoardvo", CommunityBoardvo);
		// 고객센터
		List<QnaVO> Qnavo = mainService.getQnaBoardList();
		mv.addObject("Qnavo", Qnavo);
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

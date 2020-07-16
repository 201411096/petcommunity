package com.mycompany.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.domain.FindBoardVO;
import com.mycompany.service.FindBoardServiceImpl;

@Controller
public class FindBoardController {
	@Autowired
	FindBoardServiceImpl findBoardService;

	@RequestMapping("/findboardlist.do")
	public ModelAndView getCommunityBoardList() {
		ModelAndView mv = new ModelAndView();
		
		List<FindBoardVO> findBoardVOList = findBoardService.selectProduct(new FindBoardVO());		
		mv.setViewName("/findboardlist");
		mv.addObject("findBoardVOList", findBoardVOList);
		return mv;
	}
}

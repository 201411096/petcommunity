package com.mycompany.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.service.CommunityService;

@Controller
public class CommunityController {
	
	@Autowired
	private CommunityService communityService;
	
	//게시판 목록보기 페이지로 넘겨준다
	@RequestMapping("/getCommunityBoardList.do")
	public String getCommunityBoardList() {
		return "communityBoardList";
	}
	
	
	//게시판 쓰기 페이지로 넘겨준다
	@RequestMapping("/communityBoardWrite.do")
	public String getCommunityBoardwrite() {
		return "communityBoardWrite";
	}
	
}

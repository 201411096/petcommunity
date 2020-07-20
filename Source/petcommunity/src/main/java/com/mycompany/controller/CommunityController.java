package com.mycompany.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.domain.CommunityVO;
import com.mycompany.domain.MemberVO;
import com.mycompany.service.CommunityService;

@Controller
public class CommunityController {

	@Autowired
	private CommunityService communityService;

	// 게시판 목록보기 페이지로 넘겨준다
	@RequestMapping("/communityBoardList.do")
	public ModelAndView getCommunityBoardList(CommunityVO vo, ModelAndView mv) {
		List<CommunityVO> communityBoardList = communityService.getBoardList();
		mv.addObject("communityBoardList", communityBoardList);
		mv.setViewName("communityBoardList");
		return mv;
	}

	// 게시판 쓰기 페이지로 넘겨준다
	@RequestMapping("/communityBoardWrite.do")
	public String getCommunityBoardwrite() {
		return "communityBoardWrite";
	}

	// 쓰기 완료 후 boardList로 되돌아가기
	@RequestMapping("/writeIntoBoard.do")
	public String writeIntoBoard(CommunityVO vo, HttpServletRequest request, HttpSession session, ModelAndView mv) {
		MemberVO mvo = (MemberVO) session.getAttribute("memberVO");
		mvo.getMemberId();
		vo.setMemberId(mvo.getMemberId());
		communityService.writeIntoBoard(vo);
		return "redirect:communityBoardList.do";
	}

	// 게시판 글내용 가져오기
	@RequestMapping("/getBoardContent.do")
	public ModelAndView getBoardContent(CommunityVO vo, HttpServletRequest request, ModelAndView mv) {
		// parameter로 넘어온 글번호를 vo에 셋해준후 Mapper로 넘겨줌
		String communityboardId = request.getParameter("communityboardId");
		vo.setCommunityboardId(communityboardId);

		mv.addObject("boardContent", communityService.getBoardContent(vo));//해당 글 정보 가져오기
		communityService.addReadCount(vo); //해당 글 조회수 올리기
		mv.setViewName("communityBoardContent");
		return mv;
	}

	// 검색된 게시판 list 가져오기
	@RequestMapping("/getBoardListBySearch.do")
	public ModelAndView getBoardListBySearch(CommunityVO vo, HttpServletRequest request, ModelAndView mv) {
		// parameter로 넘어온 글번호를 vo에 셋해준후 Mapper로 넘겨줌
		String searchType = request.getParameter("type");
		String keyword = request.getParameter("keyWord");
		System.out.println(keyword + " " + searchType);
		String type = "";
		// 검색타입에 따라 vo에 셋팅을 다르게 해줌
		if (searchType.equals("제목")) {
			type = "communityboard_title";
			vo.setSearchType(type);
		} else if (searchType.equals("내용")) {
			type = "communityboard_content";
			vo.setSearchType(type);
		} else if (searchType.equals("작성자")) {
			type = "member_id";
			vo.setSearchType(type);
		}

		vo.setKeyWord(keyword);
		List<CommunityVO> communityBoardListBySearch = communityService.getBoardListBySearch(vo);

		mv.addObject("communityBoardList", communityBoardListBySearch);
		mv.setViewName("communityBoardList");
		return mv;
	}

		// 카테고리에 선택된 게시판 내용 가져오기	
	@ResponseBody
	@RequestMapping("/getBoardListByCategory.do")
	public List<CommunityVO> getBoardListByCategory(CommunityVO vo, HttpServletRequest request, ModelAndView mv) { 
		String category = request.getParameter("category");
		if (category.equals("지역별")) {
			String cityName = request.getParameter("cityName");
			String province = request.getParameter("province");
			
			vo.setCityName(cityName);
			vo.setProvince(province.substring(0,2));//문자열 짤라서 '종로'처럼 두글자로 만들어줌
		
			List<CommunityVO> getBoardListByLocation = communityService.getBoardListByLocation(vo);
			System.out.println("결과값" + getBoardListByLocation);
			return getBoardListByLocation;
		} else if (category.equals("조회순")) {
			List<CommunityVO> getBoardListByReadCount = communityService.getBoardListByReadCount();
			return getBoardListByReadCount;
		} else if (category.equals("추천순")) {
			List<CommunityVO> getBoardListByRecommend = communityService.getBoardListByRecommend();
			return getBoardListByRecommend;
		} else {
			List<CommunityVO> communityBoardList = communityService.getBoardList();
			return communityBoardList;
		}

	}
	 
	// 로그인 유무 체크후 값 리턴
	@ResponseBody
	@RequestMapping("/checkSession.do")
	public String checkSession(HttpSession session, ModelAndView mv) {
		String msg = "";
		if (session.getAttribute("memberVO") == null) {
			msg = "logout";
		}
		return msg;
	}

}

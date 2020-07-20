package com.mycompany.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.domain.FindBoardVO;
import com.mycompany.domain.MemberVO;
import com.mycompany.domain.PaginationVO;
import com.mycompany.service.FindBoardServiceImpl;
import com.mycompany.util.FileUpload;

@Controller
public class FindBoardController {
	@Autowired
	FindBoardServiceImpl findBoardService;
	
	@ResponseBody
	@RequestMapping(value = "/findboardListWithPaging.do", produces = "application/json; charset=utf-8")
	public Map getCommunityBoardList(@RequestParam(defaultValue="1") int curPage, String searchWord, String searchType) {
		Map result = new HashMap();
		Map searchMap = new HashMap();
		searchMap.put("searchType", searchType);
		searchMap.put("searchWord", searchWord);
		List<FindBoardVO> findBoardVOList = findBoardService.selectFindBoard(searchMap);		
		PaginationVO paginationVO = new PaginationVO(findBoardVOList.size(), curPage);
		searchMap.put("startRow", paginationVO.getStartIndex()+1);
		searchMap.put("endRow", paginationVO.getStartIndex()+paginationVO.getPageSize());
				
		findBoardVOList = findBoardService.selectFindBoardWithPaging(searchMap);
		result.put("pagination", paginationVO);
		result.put("findBoardVOList", findBoardVOList);
		result.put("findBoardVOListSize", findBoardVOList.size());
		return result;
	}
	@RequestMapping(value = "/insertFindBoard.do", method=RequestMethod.POST, produces = "application/text; charset=utf-8")
	public ModelAndView insertFindBoard(FindBoardVO findBoardVO, HttpSession session, HttpServletRequest request, MultipartHttpServletRequest mtfRequest) throws IOException
	{
		ModelAndView mv = new ModelAndView();
		findBoardVO.setFindboardReadcount(0); // 조회수 0으로 설정
		if(session.getAttribute("memberVO")!=null) {
			findBoardVO.setMemberId( ((MemberVO)session.getAttribute("memberVO")).getMemberId() ); //로그인 되어있는 상태면 memberId값 세팅
			findBoardVO.setFindboardName( ((MemberVO)session.getAttribute("memberVO")).getMemberId() );
			findBoardVO.setFindboardTel( ((MemberVO)session.getAttribute("memberVO")).getMemberTel() );
//			System.out.println(((MemberVO)session.getAttribute("memberVO")).getMemberTel()); //전화번호를 못 가져오고 있음 -> 로그인시 전화번호도 끌어오도록 수정 필요
		}
		int insertFlag = findBoardService.insertFindBoard(findBoardVO);
		String path = new File(".").getCanonicalPath();
		if (insertFlag == 1) {
			FileUpload.makeDirectory(request.getSession().getServletContext().getRealPath("resources/imgs")+"/findboard/");
			FileUpload.uploadFiles(mtfRequest, request.getSession().getServletContext().getRealPath("resources/imgs")+"/findboard/" + findBoardVO.getFindboardId() + "/");
		}
		
		mv.setViewName("/findboardlist");
		return mv;
	}
	@RequestMapping(value="/getFindBoard.do")
	public ModelAndView getFindBoard(FindBoardVO findBoardVO, HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		findBoardVO = findBoardService.getFindBoard(findBoardVO);
		findBoardService.increaseFindBoardReadcount(findBoardVO);
		mv.setViewName("/findBoardContent");
		mv.addObject("findBoardContent", findBoardVO);
		
		String directoryPath = request.getSession().getServletContext().getRealPath("resources/imgs")+"/findboard/"+Integer.toString(findBoardVO.getFindboardId());
		File dir = new File(directoryPath);
		File fileList [] = dir.listFiles();
		ArrayList<File> fileArrayList = new ArrayList<File>();
		for(File file : fileList) {
			fileArrayList.add(file);
		}
		if(fileArrayList.size()>=1)
			fileArrayList.remove(0);
		if(fileList.length>=1)
			mv.addObject("file", fileList[0]);
		else
			mv.addObject("fileflag", -1);
		
		if( ((MemberVO)session.getAttribute("memberVO"))!=null ) { //로그인이 되어있는 상태라면
			System.out.println("findboardcontroller에서 로그인 상태 확인");
			if( ((MemberVO)session.getAttribute("memberVO")).getMemberId().equals(findBoardVO.getMemberId()) ) { //로그인이 되어있으면서 글 작성자와 같은 아이디면
				mv.addObject("isWriterFlag", 1);
			}else
				mv.addObject("isWriterFlag", 0);
		}else {
			mv.addObject("isWriterFlag", 0);
		}
		mv.addObject("fileList", fileArrayList);
		mv.addObject("directoryPath", directoryPath);
		return mv;
	}
}

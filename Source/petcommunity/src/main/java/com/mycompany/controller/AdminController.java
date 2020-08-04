package com.mycompany.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.domain.BuylistviewVO;
import com.mycompany.domain.MemberVO;
import com.mycompany.domain.QnaVO;
import com.mycompany.service.AdminService;
import com.mycompany.service.QnaService;
import com.nexacro17.xapi.data.DataSet;
import com.nexacro17.xapi.data.DataTypes;


@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	@Autowired
	private QnaService qnaService;
	
	/* 
    * 함수 이름 : 
    * 주요 기능 : 
    * 함수 내용 : 
    */
	@RequestMapping("/adminPage.do")
	public ModelAndView selectList(BuylistviewVO buylistviewvo, String startDate, String endDate) {
		ModelAndView mv = new ModelAndView();
		
		List<BuylistviewVO> salesList = adminService.adminselectList(buylistviewvo);
		mv.addObject("salesList", salesList);
		
		return mv;	
	}
	
	/* 
    * 함수 이름 : 
    * 주요 기능 :
    * 함수 내용 : 
    */
	@RequestMapping("/datesearch.do")
	public ModelAndView selectDate(String startDate, String endDate) {
		ModelAndView mv = new ModelAndView();
		Map map = new HashMap();
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		
		if(startDate=="" || startDate==null) {
	          SimpleDateFormat format = new SimpleDateFormat ("yyMMdd");            
	          Date time = new Date();
	          time.setMonth(3);
	          String strTime = format.format(time);
	          startDate= strTime.substring(0, 6);
	       }
	       if(endDate=="" || endDate==null) {
	          SimpleDateFormat format = new SimpleDateFormat ("yyMMdd");            
	          Date time = new Date();
	          String strTime = format.format(time);
	          endDate= strTime.substring(0, 6);
	       }
		
		List<BuylistviewVO> salesList = adminService.getSearchDate(map);
		for(int i=0; i<salesList.size(); i++) {
			salesList.get(i).setBuylistDate(salesList.get(i).getBuylistDate().substring(0,10));	
		}
		
		mv.addObject("salesList", salesList);
		mv.setViewName("adminPage");
		
		return mv;
	}
	
	
	/* 
    * 함수 이름 : 
    * 주요 기능 : 넥사크로
    * 함수 내용 : 
    */
	@RequestMapping("/selectInfo.do")
	public ModelAndView defaultMain(MemberVO memberevo) {
		ModelAndView mv = new ModelAndView();
		List<MemberVO> list = adminService.getMemberList(memberevo);
		//----------------------------------------
		//DB에서 받아온 값을 넥사크로로 바인딩할 수 있도록 처리
		DataSet ds = new DataSet("ar");
		ds.addColumn("memberId", DataTypes.STRING,100);
		ds.addColumn("memberName", DataTypes.STRING,100);
		ds.addColumn("memberAddress", DataTypes.STRING,100);
		ds.addColumn("memberTel", DataTypes.STRING,100);
		ds.addColumn("memberEmail", DataTypes.STRING,100);
		
		for(MemberVO vo: list) {
			int row = ds.newRow();
			ds.set(row, "memberId", vo.getMemberId());
			ds.set(row, "memberName", vo.getMemberName());
			ds.set(row, "memberAddress", vo.getMemberAddress());
			ds.set(row, "memberTel", vo.getMemberTel());
			ds.set(row, "memberEmail", vo.getMemberEmail());
		}
		mv.setViewName("all");
		mv.addObject("ds", ds);
		return mv; //all.jsp
	}
	
	
	/* 
    * 함수 이름 : 
    * 주요 기능 : 
    * 함수 내용 : 
    */
	@RequestMapping("/searchInfo.do")
	public ModelAndView getMemberSelect(String combobox, String searchword) throws UnsupportedEncodingException {
		System.out.println("getMemberSelect 컨트롤러 확인1"+combobox);
		System.out.println("getMemberSelect 컨트롤러 확인2"+searchword);
		ModelAndView mv = new ModelAndView();
		Map map = new HashMap();
		combobox =  URLDecoder.decode(combobox, "utf-8");
		searchword =  URLDecoder.decode(searchword, "utf-8");
		map.put("combobox", combobox);
		map.put("searchword", searchword);
		
		MemberVO membervo = new MemberVO();
	
		if (combobox.equals("0")) {
			membervo.setMemberId(searchword);
		}else if (combobox.equals("1")) {
			membervo.setMemberName(searchword);
		}else if (combobox.equals("2")) {
			membervo.setMemberAddress(searchword);
		}

		List<MemberVO> list = adminService.getMemberSelect(map);
		
		DataSet ds = new DataSet("ar");
		ds.addColumn("memberId", DataTypes.STRING,100);
		ds.addColumn("memberName", DataTypes.STRING,100);
		ds.addColumn("memberAddress", DataTypes.STRING,100);
		ds.addColumn("memberEmail", DataTypes.STRING,100);
		ds.addColumn("memberTel", DataTypes.STRING,100);
		
		for(MemberVO vo : list) {
			int row = ds.newRow();
			ds.set(row,"memberId",vo.getMemberId());
			ds.set(row,"memberName",vo.getMemberName());
			ds.set(row,"memberAddress",vo.getMemberAddress());
			ds.set(row,"memberEmail",vo.getMemberEmail());
			ds.set(row,"memberTel",vo.getMemberTel());
		}
		mv.setViewName("all");
		mv.addObject("ds", ds);	
		return mv;
	}
	
	/* 
    * 함수 이름 : 
    * 주요 기능 : 
    * 함수 내용 : 
    */
	@RequestMapping("/deleteInfo.do")
	public void deleteInfo(String memberId, HttpServletRequest request) {
		QnaVO qnavo = new QnaVO();
		qnavo.setMemberId(memberId);
		List<QnaVO> qnavoList = qnaService.selectQuestionGroupId(qnavo);
			for(int i=0; qnavoList.size()>i; i++) {
				qnaService.deleteQnaBoardbyGroupId(qnavoList.get(i));
			}
			adminService.deleteInfo(memberId);
			
			

		
	}
}

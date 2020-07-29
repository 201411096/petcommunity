package com.mycompany.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.domain.BuylistviewVO;
import com.mycompany.domain.PaginationVO;
import com.mycompany.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/adminPage.do")
	public ModelAndView selectList(BuylistviewVO buylistviewvo, String startDate, String endDate) {
		ModelAndView mv = new ModelAndView();
		
		List<BuylistviewVO> salesList = adminService.adminselectList(buylistviewvo);
		mv.addObject("salesList", salesList);
		
		return mv;	
	}
	
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
}

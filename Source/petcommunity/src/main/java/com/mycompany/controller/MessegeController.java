package com.mycompany.controller;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.domain.MemberVO;
import com.mycompany.domain.MessageVO;
import com.mycompany.service.MessageServiceImpl;

@Controller
public class MessegeController {
	
	@Autowired
	public MessageServiceImpl messageService; 
	
	// chat 가져오기
	@ResponseBody
	@RequestMapping("/message.do")
	public Map messege(HttpSession session, String id) {
		MemberVO mvo = (MemberVO)session.getAttribute("memberVO");
		String loginId = mvo.getMemberId();
		Map map = new HashMap();	
		
		return map;
	}
	// 대화상대 찾아오기
	@ResponseBody
	@RequestMapping("/getMessagePartner.do")
	public Map getMessegePartner(HttpSession session, int startPage, int endPage, String otherId) {
		MemberVO mvo = (MemberVO)session.getAttribute("memberVO");
		String id = mvo.getMemberId();
		System.out.println(id);
		System.out.println(otherId);
		Map searchMap = new HashMap();
		if(otherId.equals("1")||otherId.equals("나")) {
			otherId=id;
		}
		searchMap.put("otherId", otherId);
		searchMap.put("id", id);
		searchMap.put("startPage", startPage);
		searchMap.put("endPage", endPage);
		List<MessageVO> messageVO = messageService.getMessagePartner(searchMap);
		// set을 통해 중복값 제거
//		Set<String> messagePartnerList = new HashSet<String>();
//		for(MessageVO i: messageVO) {
//			String target1 = i.getMessageTarget1();
//			String target2 = i.getMessageTartget2();
//			if(!target1.equals(id)) {
//				messagePartnerList.add(target1);
//			}
//			if(!target2.equals(id)) {
//				messagePartnerList.add(target2);
//			}
//		}
		
//		for(String i: messagePartnerList) {
//			/* List<MessageVO> time = messageService.messageTimeSelect(i); */
//		}
		Map map = new HashMap();
		map.put("loginId", id);
		map.put("messageList",messageVO);
		map.put("messageListSize",messageVO.size());
		return map;
	}
}

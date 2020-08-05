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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.domain.MemberVO;
import com.mycompany.domain.MessageVO;
import com.mycompany.service.MessageServiceImpl;

@Controller
public class MessegeController {
	
	@Autowired
	public MessageServiceImpl messageService; 
	
	@RequestMapping("/message.do")
	public ModelAndView messege() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("message");
		
		return mv;
	}
	// 대화상대 찾아오기
	@ResponseBody
	@RequestMapping("/getMessagePartner.do")
	public Map getMessegePartner(HttpSession session) {
		MemberVO mvo = (MemberVO)session.getAttribute("memberVO");
		String id = mvo.getMemberId();
		List<MessageVO> messageVO = messageService.getMessagePartner(id);
		// set을 통해 중복값 제거
		Set<String> messagePartnerList = new HashSet<String>();
		for(MessageVO i: messageVO) {
			String target1 = i.getMessageTarget1();
			String target2 = i.getMessageTartget2();
			if(!target1.equals(id)) {
				messagePartnerList.add(target1);
			}
			if(!target2.equals(id)) {
				messagePartnerList.add(target2);
			}
		}
		
//		for(String i: messagePartnerList) {
//			System.out.println("정답"+i);
//		}
		Map map = new HashMap();
		map.put("messageList",messagePartnerList);
		map.put("messageListSize",messagePartnerList.size());
		return map;
	}
}

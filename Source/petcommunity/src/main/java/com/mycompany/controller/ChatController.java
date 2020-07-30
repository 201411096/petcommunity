package com.mycompany.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ChatController {

	@RequestMapping(value = "/getMemberInfo.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map getMemberInfo(HttpSession session) {
		System.out.println("getMemberInfo 진입");
		Map result = new HashMap();
		result.put("memberInfo", session.getAttribute("memberVO"));
		return result;
	}
}

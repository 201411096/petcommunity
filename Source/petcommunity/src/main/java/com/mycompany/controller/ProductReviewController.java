package com.mycompany.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.domain.MemberVO;
import com.mycompany.domain.ProductreviewVO;
import com.mycompany.service.ProductreviewService;

@Controller
public class ProductReviewController {
	
	@Autowired
	ProductreviewService productreviewService;
	
	@ResponseBody
	@RequestMapping(value="/insertProductReview.do", produces = "application/json; charset=utf-8")
	public Map insertReivew(HttpSession session, ProductreviewVO vo) {
		Map result = new HashMap();
		Map searchMap = new HashMap();
		MemberVO memberVo = (MemberVO)session.getAttribute("MemberVO");
		System.out.println(memberVo);
		// 로그인 상태 check
		if (memberVo == null) { //로그인 안된 상태
			result.put("logout", "logout");
			return result;
		}else {//로그인 된 상태
			searchMap.put("productId", vo.getProductId());
			searchMap.put("productreviewScore", vo.getProductreviewScore());
			searchMap.put("productreviewContent", vo.getProductreviewContent());
			searchMap.put("productId", memberVo.getMemberId());
			//리뷰 작성 유무 확인
			int reviewConfirm = productreviewService.reviewCheck(searchMap);
		}
		
		//작성한 리뷰가 있는지 확인
		
		
		return result;
	}
}

package com.mycompany.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.domain.MemberVO;
import com.mycompany.domain.ProductCartVO;
import com.mycompany.service.ProductCartService;


@Controller
public class ProductCartController {
	
	@Autowired
	public ProductCartService productCartService;
	
	//장바구니 페이지 입장~~!!
	@ResponseBody
	@RequestMapping(value="/productCartByAjax.do")
	public List<ProductCartVO> productSelectList (HttpSession session, ProductCartVO cvo) {
		System.out.println("장바구니 페이지 입장!~ ");
		MemberVO vo = (MemberVO)session.getAttribute("memberVO");
		if(vo.getMemberId()!=null) {
			cvo.setMemberId(vo.getMemberId());
		}else {
			
		}
		List<ProductCartVO> cartListById = productCartService.getCartListById(cvo);
		return cartListById;
		
	}


}

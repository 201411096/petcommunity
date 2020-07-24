package com.mycompany.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.mycompany.domain.MemberVO;
import com.mycompany.domain.PaginationVO;
import com.mycompany.domain.ProductVO;
import com.mycompany.domain.ShopVO;
import com.mycompany.service.ProductServiceImpl;


@Controller
public class ProductCartController {
	
	@Autowired
	public ProductServiceImpl productService;
	
	//장바구니 페이지 입장~~!!
	@RequestMapping(value="/productCart.do")
	public void productSelectList () {
		System.out.println("장바구니 페이지 입장!~ ");
		
	}


}

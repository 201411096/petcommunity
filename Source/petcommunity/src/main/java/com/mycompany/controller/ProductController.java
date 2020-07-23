package com.mycompany.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.mycompany.domain.PaginationVO;
import com.mycompany.domain.ProductVO;
import com.mycompany.domain.ShopVO;
import com.mycompany.service.ProductServiceImpl;


@Controller
public class ProductController {
	
	@Autowired
	public ProductServiceImpl productService;
	
	@ResponseBody
	@RequestMapping(value="/productSelect.do", produces = "application/json; charset=utf-8")
	public Map productSelectList (@RequestParam (defaultValue = "1") int curPage, String tagCategory, ProductVO vo) {
		Map result = new HashMap();
		Map searchMap = new HashMap(); 
		searchMap.put("tagCategory", tagCategory);
		List<ProductVO> productList = productService.selectProductListBytagCategory(searchMap);
		PaginationVO paginationVO = new PaginationVO(productList.size(), curPage);
		searchMap.put("startRow", paginationVO.getStartIndex()+1);
		paginationVO.setPageSize(9);
		searchMap.put("endRow", paginationVO.getStartIndex()+paginationVO.getPageSize());
		productList = productService.selectProductListForPagination(searchMap);
		
		result.put("pagination", paginationVO);
		result.put("productList", productList);
		result.put("productListSize", productList.size());
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/productAutoCompleteSearch.do", produces = "application/json; charset=utf-8")
	public String productAutoCompleteSearch(String searchSomething, ProductVO vo) {
		List<String> result = productService.selectAutoSearchProduct(searchSomething);
		System.out.println(result);
		String[] productList = new String[result.size()];
		
		if (result != null) {
			for(int i=0; i<result.size(); i++) {
				productList[i] = (String)result.get(i);
			}
		}
		Gson gson = new Gson();
		return gson.toJson(productList);
	}
	
	@RequestMapping(value="/productView.do")
	public ModelAndView productView(ProductVO vo) {
		ModelAndView mv = new ModelAndView();
		int productId = vo.getProductId(); 
		System.out.println(productId);
		ProductVO productInfo =productService.selectProductInfo(productId);
		mv.addObject("productInfo", productInfo);
		mv.setViewName("productView");
		return mv;
	}
	@RequestMapping(value="/buyCartList.do")
	public ModelAndView test(ProductVO vo, String qty) {
		System.out.println("넘어온 상품"+vo.getProductId());
		System.out.println("넘어온 개수"+qty);
		ModelAndView mv = new ModelAndView();
		return mv;
	}
}

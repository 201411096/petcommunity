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

import com.mycompany.domain.ProductVO;
import com.mycompany.service.AdminService;
import com.mycompany.service.AdminServiceImpl;
import com.mycompany.service.AdminProductService;
import com.mycompany.service.AdminProductServiceImpl;
import com.mycompany.service.ProductServiceImpl;

@Controller
public class AdminProductController {
	
	@Autowired
	AdminProductServiceImpl adminProductService;
	@Autowired
	ProductServiceImpl productService;
	@Autowired
	AdminServiceImpl adminService;

	/* 
	 * 함수 이름 : loadAdminProduct
	 * 주요 기능 : 상품 리스트 화면 로딩
	 */
	@RequestMapping("/adminProductList.do")
	public ModelAndView loadAdminProduct() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/adminProductList");
		return mv;
	}
	
	
	/* 
	 * 함수 이름 : getProductData
	 * 주요 기능 : 상품 리스트 반환
	 * 함수 내용 
	 * 		ㄴ jsp에서 검색어를 받아옴 (검색어가 없을 경우 -> 전체 검색)
	 * 		ㄴ 검색어로 검색한 상품 리스트와 리스트 크기를 json형태로 반환
	 */
	@RequestMapping(value = "/adminProductList/getProductData.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map getProductData(HttpSession session, @RequestParam(value = "searchWord") String searchWord) {
		Map result = new HashMap();
		Map<String, String> search = new HashMap<String, String>();
		search.put("searchWord", searchWord);
		List<ProductVO> productList = productService.searchListProduct(search);
		result.put("productList", productList);
		result.put("productListSize", productList.size());
		return result;
	}
	
	/* 
	 * 함수 이름 : prodcutInsertPage
	 * 주요 기능 : 상품 등록 페이지를 불러옴
	 */
	@RequestMapping(value = "/adminProductList/loadInsertProduct.do")
	public ModelAndView productInsertPage(HttpSession session, ProductVO productVO) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adminProductList/adminProductInsert");
		return mv;
	}
	
	/* 
	 * 함수 이름 : productInsert
	 * 주요 기능 : 상품을 등록하고 상품 리스트 페이지로 이동함
	 */
	@RequestMapping(value = "/adminProductList/insertProduct.do")
	public ModelAndView productInsert(HttpSession session, ProductVO productVO) {
		ModelAndView mv = new ModelAndView();

		// 상품 등록해야되는 부분
		adminProductService.insertProduct(productVO);
		mv.setViewName("/adminProductList/adminProductList");
		return mv;
	}
	
	
	/* 
	 * 함수 이름 : productDelete
	 * 주요 기능 : 상품을 삭제하고 상품 리스트 페이지로 이동함
	 */
	@RequestMapping(value = "/adminProductList/productDelete.do")
	public ModelAndView productDelete(HttpSession session, ProductVO productVO) {
		ModelAndView mv = new ModelAndView();
		adminProductService.deleteProduct(productVO);
		mv.setViewName("/adminProductList/adminProductList");
		return mv;
	}
	
	
	/* 
	 * 함수 이름 : loadProductUpdatePage
	 * 주요 기능 : 상품 수정 페이지를 로딩함
	 * 함수 내용
	 * 		ㄴ 상품 수정 페이지를 로딩함
	 * 		ㄴ 상품 id를 같이 화면에 넘겨줌
	 */
	@RequestMapping(value = "/adminProductList/loadProductUpdatePage.do")
	public ModelAndView loadProductUpdatePage(HttpSession session, int productId) {
		ModelAndView mv = new ModelAndView();
		ProductVO productVO = new ProductVO();
		productVO.setProductId(productId);
		productVO = (ProductVO) adminProductService.selectProduct(productVO);
		mv.addObject("ProductVO", productVO);
		mv.setViewName("/adminProductList/adminProductUpdate");
		return mv;
	}
	
	
	/* 
	 * 함수 이름 : productUpdate
	 * 주요 기능 : 상품 정보를 수정함
	 * 함수 내용
	 * 		ㄴ 받아온 상품 id에 해당하는 상품을 받아온 상품 정보로 수정함 
	 */
	@RequestMapping(value = "/adminProductList/productUpdatePage.do")
	public ModelAndView productUpdate(HttpSession session, ProductVO productVO) {
		ModelAndView mv = new ModelAndView();
		adminProductService.updateProduct(productVO);
		mv.setViewName("/adminProductList/adminProductList");
		return mv;
	}

}


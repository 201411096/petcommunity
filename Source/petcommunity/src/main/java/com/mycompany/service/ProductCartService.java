package com.mycompany.service;

import java.util.List;
import java.util.Map;

import com.mycompany.domain.ProductCartVO;

public interface ProductCartService {
	public List<ProductCartVO> getCartListById(ProductCartVO vo);
	public void changeProductCntOnCart(ProductCartVO vo);
	public void deleteProductFromCart(ProductCartVO vo);
}

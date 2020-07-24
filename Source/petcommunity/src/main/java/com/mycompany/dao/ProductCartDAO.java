package com.mycompany.dao;

import java.util.List;
import java.util.Map;

import com.mycompany.domain.ProductCartVO;

public interface ProductCartDAO {
	public List<ProductCartVO> getCartListById(ProductCartVO vo);
}

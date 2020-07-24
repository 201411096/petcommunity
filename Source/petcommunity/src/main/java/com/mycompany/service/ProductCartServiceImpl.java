package com.mycompany.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.dao.ProductCartDAOImpl;
import com.mycompany.domain.ProductCartVO;

@Service("ProductService")
public class ProductCartServiceImpl implements ProductCartService {

	
	@Autowired
	private ProductCartDAOImpl productCartDAO;


	@Override
	public List<ProductCartVO> getCartListById(ProductCartVO vo) {
		return productCartDAO.getCartListById(vo);
	}
	


}

package com.mycompany.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.dao.CrudDAOImpl;
import com.mycompany.domain.ProductVO;

@Service("CrudService")
public class CrudServiceImpl implements CrudService {

	@Autowired
	CrudDAOImpl crudDAO;
	
	@Override
	public int insertProduct(ProductVO productvo) {
		
		return crudDAO.insertProduct(productvo);
	}

	@Override
	public List<ProductVO> selectProduct(ProductVO productvo) {
		
		return crudDAO.selectProduct(productvo);
	}

	@Override
	public int updateProduct(ProductVO productvo) {
		return crudDAO.updateProduct(productvo);
	}

	@Override
	public int deleteProduct(ProductVO productvo) {
		
		return crudDAO.deleteProduct(productvo);
	}

}

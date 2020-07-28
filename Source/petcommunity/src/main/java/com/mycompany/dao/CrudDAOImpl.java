package com.mycompany.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.mycompany.domain.ProductVO;

@Repository("crudDAO")
public class CrudDAOImpl implements CrudDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	public int insertProduct(ProductVO vo) {
		int result = mybatis.insert("CrudDAO.insertProduct", vo);
		return result;
	}

	
	public List<ProductVO> selectProduct(ProductVO productvo) {
		List<ProductVO> product = mybatis.selectList("CrudDAO.selectProduct", productvo);
		return product;
	}

	public int updateProduct(ProductVO productvo) {
		int result = mybatis.update("CrudDAO.updateProduct", productvo);
		return result;
	}

	public int deleteProduct(ProductVO productvo) {
		int result = mybatis.delete("CrudDAO.deleteProduct", productvo);
		return result;
	}

}

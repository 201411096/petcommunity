package com.mycompany.dao;

import java.util.List;
import java.util.Map;

import com.mycompany.domain.ProductVO;

public interface CrudDAO {
	public int insertProduct(ProductVO productvo);
	public List<ProductVO> selectProduct(ProductVO productvo);
	public int updateProduct(ProductVO productvo);
	public int deleteProduct(ProductVO productvo);

}

package com.mycompany.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("productreviewDAO")
public class ProductreviewDAOImpl implements ProductreviewDAO{
	@Autowired
	SqlSessionTemplate mybatis;
	@Override
	public int reviewCheck(Map searchMap) {
		int result = mybatis.selectOne("ProductreviewDAO.reviewCheck", searchMap);
		return result;
	}

}

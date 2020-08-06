package com.mycompany.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.domain.MessageVO;

@Repository("messageDAO")
public class MessageDAOImpl implements MessageDAO{
	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public List<MessageVO> getMessagePartner(Map searchMap) {
		List<MessageVO> result = mybatis.selectList("messageDAO.getMessagePartner", searchMap);
		return result;
	}

}

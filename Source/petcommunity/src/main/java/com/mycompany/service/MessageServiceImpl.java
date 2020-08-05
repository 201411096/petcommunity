package com.mycompany.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.dao.MessageDAOImpl;
import com.mycompany.domain.MessageVO;

@Service("messegeService")
public class MessageServiceImpl implements MessageService{
	@Autowired
	MessageDAOImpl messageDAO;
	@Override
	public List<MessageVO> getMessagePartner(String id) {
		List<MessageVO> result = messageDAO.getMessagePartner(id);
		return result;
	
	}

}

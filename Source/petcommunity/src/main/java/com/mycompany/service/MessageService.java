package com.mycompany.service;

import java.util.List;
import java.util.Map;

import com.mycompany.domain.MessageVO;

public interface MessageService {
	public void insertMessage(Map searchMap);
	public List<MessageVO> getMessagePartner(Map searchMap);
	public List<MessageVO> getMessagePartner2(Map searchMap);
}

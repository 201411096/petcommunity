package com.mycompany.service;

import java.util.List;
import java.util.Map;

import com.mycompany.domain.MessageVO;

public interface MessageService {
	public List<MessageVO> getMessagePartner(Map searchMap);
}

package com.mycompany.service;

import java.util.List;

import com.mycompany.domain.MessageVO;

public interface MessageService {
	public List<MessageVO> getMessagePartner(String id);
}

package com.mycompany.dao;

import java.util.List;

import com.mycompany.domain.MessageVO;

public interface MessageDAO {
	public List<MessageVO> getMessagePartner(String id);
}

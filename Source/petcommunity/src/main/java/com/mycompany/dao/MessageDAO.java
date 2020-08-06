package com.mycompany.dao;

import java.util.List;
import java.util.Map;

import com.mycompany.domain.MessageVO;

public interface MessageDAO {
	public List<MessageVO> getMessagePartner(Map searchMap);
}

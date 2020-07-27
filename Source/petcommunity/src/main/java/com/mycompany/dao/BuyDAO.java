package com.mycompany.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mycompany.domain.MemberVO;

public interface BuyDAO {
	
	public List<Map<String,String>> buyList(MemberVO vo);
	
	public List<Map<String,String>> buyReceipt(String id);
}

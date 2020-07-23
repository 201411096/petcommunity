package com.mycompany.dao;

import java.util.List;

import com.mycompany.domain.MemberVO;
import com.mycompany.domain.MyBuyVO;

public interface BuyDAO {
	
	public List<MyBuyVO> buyList(MemberVO vo);
}

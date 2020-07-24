package com.mycompany.service;

import java.util.List;

import com.mycompany.domain.MemberVO;
import com.mycompany.domain.MyBuyVO;

public interface BuyService {

	public List<MyBuyVO> buyList(MemberVO vo);
}

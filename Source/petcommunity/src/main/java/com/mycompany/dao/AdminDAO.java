package com.mycompany.dao;

import java.util.List;
import java.util.Map;

import com.mycompany.domain.BuylistviewVO;
import com.mycompany.domain.MemberVO;

public interface AdminDAO {

	public List<BuylistviewVO> adminselectList(BuylistviewVO buylistviewvo);
	public List<BuylistviewVO> getSearchDate(Map map);
	public List<MemberVO> getgetMemberList(MemberVO membervo);
	public List<MemberVO> getMemberSelect(Map map);
	public int deleteInfo(String memberId);

}

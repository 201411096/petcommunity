package com.mycompany.service;

import java.util.List;
import java.util.Map;

import com.mycompany.domain.BuylistviewVO;

public interface AdminService  {

	public List<BuylistviewVO> adminselectList(BuylistviewVO buylistviewvo);
	
	public List<BuylistviewVO> getSearchDate(Map map);


}

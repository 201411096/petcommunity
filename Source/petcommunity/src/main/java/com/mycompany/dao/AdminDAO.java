package com.mycompany.dao;

import java.util.List;
import java.util.Map;

import com.mycompany.domain.BuylistviewVO;

public interface AdminDAO {

	public List<BuylistviewVO> getSalesList(BuylistviewVO buylistviewvo);
	public List<BuylistviewVO> getSearchDate(Map map);
}

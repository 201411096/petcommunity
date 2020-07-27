package com.mycompany.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.domain.ProductVO;

public interface AdminService  {

	public List<ProductVO> getSalesList();
	


}

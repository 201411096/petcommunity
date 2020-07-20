package com.mycompany.service;

import java.util.List;

import com.mycompany.domain.QnaVO;

public interface QnaService {
	
	public int insertQna(QnaVO qnavo); 
	public List<QnaVO> selectQnaList(QnaVO qnavo);
	public QnaVO selectOne(QnaVO qnavo);

	
	
}

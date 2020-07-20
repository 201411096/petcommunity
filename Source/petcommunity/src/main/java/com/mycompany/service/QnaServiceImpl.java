package com.mycompany.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.dao.QnaDAOImpl;
import com.mycompany.domain.QnaVO;

@Service("qnaService")
public class QnaServiceImpl implements QnaService{

	@Autowired
	private QnaDAOImpl qnaDAO;
	
	@Override
	public int insertQna(QnaVO qnavo) {
		return qnaDAO.insertQna(qnavo);
	}


	@Override
	public List<QnaVO> selectQnaList(QnaVO qnavo) {
		return qnaDAO.selectQnaList(qnavo);
	}


	@Override
	public QnaVO selectOne(QnaVO qnavo) {
		return qnaDAO.selectOne(qnavo);
	}




	
	

}

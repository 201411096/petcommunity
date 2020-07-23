package com.mycompany.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.domain.QnaVO;

@Repository("qnaDAO")
public class QnaDAOImpl implements QnaDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public int insertQna(QnaVO qnavo) {
		int result = mybatis.insert("qnaDAO.insertQna", qnavo);
		return result;
	}
	

	public List<QnaVO> selectQnaList(QnaVO qnavo) {
		return mybatis.selectList("qnaDAO.selectQnaList", qnavo);
	}


	public QnaVO selectOne(QnaVO qnavo) {
		return mybatis.selectOne("qnaDAO.selectOne", qnavo);
	}


	@Override
	public int updateQna(QnaVO qnavo) {
		return mybatis.update("qnaDAO.update", qnavo);
	}


	public void updateReadcount(QnaVO qnavo) {
		mybatis.update("qnaDAO.updateReadcount", qnavo);
	}


	public void delete(QnaVO qnavo) {
		mybatis.delete("qnaDAO.delete", qnavo);
		
	}

	public List<QnaVO> selectKeywork(Map map) {
		return mybatis.selectList("qnaDAO.selectKeyword", map);
		
	}

	public void insertReplyQna(QnaVO qnavo) {
		mybatis.insert("qnaDAO.insertReplyQna", qnavo);
	}
	





	

	

}

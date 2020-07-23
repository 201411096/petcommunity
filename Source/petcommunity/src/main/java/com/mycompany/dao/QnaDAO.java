package com.mycompany.dao;

import java.util.List;
import java.util.Map;

import com.mycompany.domain.QnaVO;

public interface QnaDAO {
	public int insertQna(QnaVO qnavo);
	public List<QnaVO> selectQnaList(QnaVO qnavo);
	public QnaVO selectOne(QnaVO qnavo);
	public int updateQna(QnaVO qnavo);
	public void updateReadcount(QnaVO qnavo);
	public void delete(QnaVO qnavo);
	public List<QnaVO> selectKeywork(Map map);
	public void insertReplyQna(QnaVO qnavo);
}

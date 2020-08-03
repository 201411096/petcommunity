package com.mycompany.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.dao.MemberDAOImpl;
import com.mycompany.domain.LostBoardVO;
import com.mycompany.domain.MemberVO;

@Service("MemberService")
public class MemberServiceImpl implements MemberService {

	
	@Autowired
	private MemberDAOImpl memberDAO;
	
	@Override
	public int signup(MemberVO vo) {
		return memberDAO.signup(vo); 
		
	}

	@Override
	public int idcheck(MemberVO vo) {
		return  memberDAO.idcheck(vo);
	}

	@Override
	public MemberVO signin(MemberVO vo) {
		
		return memberDAO.signin(vo);
	}

	
	
	
	@Override
	public void tokenInsert(MemberVO vo) {
		memberDAO.tokenInsert(vo);
		
	}

	@Override
	public List<MemberVO> selectPeopleAroundLocation(LostBoardVO vo) {
		return memberDAO.selectPeopleAroundLocation(vo);
	}
	
	@Override
	public String selectListPushTarget(String lostBoardWriter) {
		return memberDAO.selectListPushTarget(lostBoardWriter);
	}

	@Override
	public MemberVO memberList(String id) {
		
		return memberDAO.memberList(id);
	}

	@Override
	public int updateMember(MemberVO vo) {
		
		return memberDAO.updateMember(vo);
	}

}

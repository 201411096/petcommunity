package com.mycompany.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.dao.MemberDAOImpl;
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

}

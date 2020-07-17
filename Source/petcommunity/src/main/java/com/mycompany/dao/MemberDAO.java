package com.mycompany.dao;

import com.mycompany.domain.MemberVO;

public interface MemberDAO {
	public int signup(MemberVO vo);
	
	public int idcheck(MemberVO vo);
	
	public MemberVO signin(MemberVO vo);
}

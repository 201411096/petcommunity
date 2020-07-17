package com.mycompany.service;

import com.mycompany.domain.MemberVO;

public interface MemberService {
	public int signup(MemberVO vo);
	
	public int idcheck(MemberVO vo);
	
	public MemberVO signin(MemberVO vo);
}

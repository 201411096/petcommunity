package com.mycompany.service;

import java.util.List;

import com.mycompany.domain.LostBoardVO;
import com.mycompany.domain.MemberVO;

public interface MemberService {
	public int signup(MemberVO vo);
	
	public int idcheck(MemberVO vo);
	
	public MemberVO signin(MemberVO vo);
	
	//token값 추가(MemberController)
	public void tokenInsert(MemberVO vo);
	
	//실종 게시물 주변 사람들 select(lostBoardController)
	public List<MemberVO> selectPeopleAroundLocation(LostBoardVO vo);
}

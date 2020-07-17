package com.mycompany.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO{

	@Autowired
	private SqlSessionTemplate mybatis;
	@Override
	public int signup(MemberVO vo) {
		return mybatis.insert("member.signup",vo);
	}
	@Override
	public int idcheck(MemberVO vo) {
		return  mybatis.selectOne("member.idcheck", vo);
	}
	@Override
	public MemberVO signin(MemberVO vo) {
		
		return mybatis.selectOne("member.signin",vo);
	}

}

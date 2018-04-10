package com.kh.narumaru.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.kh.narumaru.member.model.exception.LoginException;
import com.kh.narumaru.member.model.vo.Member;


@Repository
public class MemberDaoImpl implements MemberDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	
	@Override
	public Member loginCheck(Member m) throws LoginException {
		
		Member member = null;
		
		String userPwd = sqlSession.selectOne("Member.selectPwd", m.getEmail());
		
		if(!userPwd.equals(m.getUserPwd())){
			throw new LoginException("로그인실패!!");
		}else{
			member = sqlSession.selectOne("Member.loginCheck", m);
		}
		
		return member;
	}

}

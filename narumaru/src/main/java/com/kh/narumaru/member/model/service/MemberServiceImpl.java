package com.kh.narumaru.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.narumaru.member.model.dao.MemberDao;
import com.kh.narumaru.member.model.exception.LoginException;
import com.kh.narumaru.member.model.vo.Member;


@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDao md;
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	
	@Override
	public Member loginMember(Member m) throws LoginException{

		return md.loginCheck(m);
	}

}

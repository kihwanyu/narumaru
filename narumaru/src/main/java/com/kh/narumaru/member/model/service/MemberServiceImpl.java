package com.kh.narumaru.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.narumaru.member.model.dao.MemberDao;
import com.kh.narumaru.member.model.exception.LoginException;
import com.kh.narumaru.member.model.exception.ProfileChangeException;
import com.kh.narumaru.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDao md;
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	
	@Override
	public Member loginMember(Member m) throws LoginException{

		return md.loginCheck(m);
	}


	@Override
	public void insertMember(Member m) {
		
		int result = md.insertMember(sqlSession, m);
		
		
	}


	@Override
	public void profileChange(Member m) throws ProfileChangeException {
		
		md.profileChange(sqlSession, m);
		
	}

}

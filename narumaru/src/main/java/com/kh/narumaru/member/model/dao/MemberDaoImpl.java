package com.kh.narumaru.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.kh.narumaru.member.model.exception.LoginException;
import com.kh.narumaru.member.model.exception.ProfileChangeException;
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
		
		System.out.println("memberdao : " + m);
		
		String id = m.getEmail().substring(0, m.getEmail().lastIndexOf('@'));
		
		System.out.println(id);
		
		//id += "@naver.com";
		
		String userPwd = sqlSession.selectOne("Member.selectPwd", id);
		System.out.println("userEmail : " + m.getEmail());
		
		System.out.println("userPWd" + userPwd);
		System.out.println("getuserpwd" + m.getUserPwd());
		if(!m.getUserPwd().equals(userPwd)){
			throw new LoginException("로그인실패!!");
		}else{
			member = sqlSession.selectOne("Member.loginCheck", m);
		}
		
		return member;
	}


	@Override
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.insert("Member.insertMember", m);
	}


	@Override
	public void profileChange(SqlSessionTemplate sqlSession, Member m) throws ProfileChangeException {
		
		int result = sqlSession.update("Member.profileChange", m);
		
		if(result <= 0){
			throw new ProfileChangeException("회원 프로필 변경 실패!!");
		}
	}

}

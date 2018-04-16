package com.kh.narumaru.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.narumaru.member.model.exception.LoginException;
import com.kh.narumaru.member.model.vo.Member;

public interface MemberDao {

	Member loginCheck(Member m) throws LoginException;

	int insertMember(SqlSessionTemplate sqlSession, Member m);

}

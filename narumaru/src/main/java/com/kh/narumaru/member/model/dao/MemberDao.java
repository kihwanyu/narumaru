package com.kh.narumaru.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.narumaru.common.model.vo.PageInfo;
import com.kh.narumaru.member.model.exception.LoginException;
import com.kh.narumaru.member.model.exception.ProfileChangeException;
import com.kh.narumaru.member.model.exception.birthdayChangeException;
import com.kh.narumaru.member.model.exception.genderChangeException;
import com.kh.narumaru.member.model.exception.nameChangeException;
import com.kh.narumaru.member.model.exception.passwordChangeException;
import com.kh.narumaru.member.model.exception.phoneChangeException;
import com.kh.narumaru.member.model.exception.statusUpdateException;
import com.kh.narumaru.member.model.vo.LogInfo;
import com.kh.narumaru.member.model.vo.Member;

public interface MemberDao {

	Member loginCheck(Member m) throws LoginException;

	int insertMember(SqlSessionTemplate sqlSession, Member m);

	void profileChange(SqlSessionTemplate sqlSession, Member m) throws ProfileChangeException;

	void birthdayChange(SqlSessionTemplate sqlSession, Member m) throws birthdayChangeException;

	void nameChange(SqlSessionTemplate sqlSession, Member m) throws nameChangeException;

	void genderChange(SqlSessionTemplate sqlSession, Member m) throws genderChangeException;

	void phoneChange(SqlSessionTemplate sqlSession, Member m) throws phoneChangeException;

	void passwordChange(SqlSessionTemplate sqlSession, Member m) throws passwordChangeException;

	void memberStatusUpdate(SqlSessionTemplate sqlSession, Member m) throws statusUpdateException;

	String findEmail(SqlSessionTemplate sqlSession, Member m);

	String sendPwd(SqlSessionTemplate sqlSession, Member m);

	void sendUpdatePwd(SqlSessionTemplate sqlSession, Member m);


	LogInfo selectNation(SqlSessionTemplate sqlSession, LogInfo li);

	Member selectMemberOne(int mno);

	void insertLogInfo(SqlSessionTemplate sqlSession, LogInfo li2);

	int getLoginCount(SqlSessionTemplate sqlSession, int mno);

	ArrayList<LogInfo> getLoginListCount(SqlSessionTemplate sqlSession, PageInfo pi);

}

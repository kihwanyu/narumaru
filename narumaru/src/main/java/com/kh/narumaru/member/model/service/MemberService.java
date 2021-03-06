package com.kh.narumaru.member.model.service;

import java.util.ArrayList;

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

public interface MemberService {

	Member loginMember(Member m) throws LoginException;

	void insertMember(Member m);

	void profileChange(Member m) throws ProfileChangeException;

	void birthdayChange(Member m) throws birthdayChangeException;

	void nameChange(Member m) throws nameChangeException;

	void genderChange(Member m) throws genderChangeException;

	void phoneChange(Member m) throws phoneChangeException;

	void passwordChange(Member m) throws passwordChangeException;

	void memberStatusUpdate(Member m) throws statusUpdateException;

	String findEmail(Member m);

	boolean sendPwd(Member m);

	void sendUpdatePwd(Member m2);

	LogInfo selectNation(LogInfo li);

	Member selectMemberOne(int mno);

	void insertLogInfo(LogInfo li2);

	int getLoginCount(int mno);

	ArrayList<LogInfo> getLoginListCount(PageInfo pi);

}
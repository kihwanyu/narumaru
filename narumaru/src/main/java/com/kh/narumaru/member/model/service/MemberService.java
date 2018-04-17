package com.kh.narumaru.member.model.service;

import com.kh.narumaru.member.model.exception.LoginException;
import com.kh.narumaru.member.model.exception.ProfileChangeException;
import com.kh.narumaru.member.model.exception.birthdayChangeException;
import com.kh.narumaru.member.model.exception.nameChangeException;
import com.kh.narumaru.member.model.vo.Member;

public interface MemberService {

	Member loginMember(Member m) throws LoginException;

	void insertMember(Member m);

	void profileChange(Member m) throws ProfileChangeException;

	void birthdayChange(Member m) throws birthdayChangeException;

	void nameChange(Member m) throws nameChangeException;

}
package com.kh.narumaru.member.model.service;

import com.kh.narumaru.member.model.exception.LoginException;
import com.kh.narumaru.member.model.vo.Member;

public interface MemberService {

	Member loginMember(Member m) throws LoginException;

}

package com.kh.narumaru.maru.model.service;

import java.util.ArrayList;

import com.kh.narumaru.maru.model.vo.MaruMember;
import com.kh.narumaru.member.model.vo.Member;

public interface MaruService {
	ArrayList<MaruMember> selectMaruMemberList(int nmno); // 특정 마루의 회원 리스트
	
	MaruMember selectMaruMemberOne(int nmno, int mno); // 특정 회원 찾기, 이미 가입한지 찾을때도 쓸듯.
	
	void insertMaruMember(int nmno, Member m); // 마루 가입
	
	void deleteMaruMember(int nmno, int mno); // 마루 탈퇴
}
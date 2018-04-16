package com.kh.narumaru.maru.model.dao;

import java.util.ArrayList;

import com.kh.narumaru.maru.exception.MaruException;
import com.kh.narumaru.maru.model.vo.MaruMember;
import com.kh.narumaru.member.model.vo.Member;

public interface MaruDao {
	ArrayList<MaruMember> selectMaruMemberList(int nmno);
	
	MaruMember selectMaruMemberOne(int nmno, int mno);
	
	void insertMaruMember(MaruMember mm) throws MaruException;
	
	void deleteMaruMember(int nmno, int mno); 
}

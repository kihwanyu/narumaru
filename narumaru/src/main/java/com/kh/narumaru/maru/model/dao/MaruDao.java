package com.kh.narumaru.maru.model.dao;

import java.util.ArrayList;

import com.kh.narumaru.maru.exception.MaruException;
import com.kh.narumaru.maru.model.vo.MaruMember;
import com.kh.narumaru.member.model.vo.Member;
import com.kh.narumaru.narumaru.model.vo.Narumaru;

public interface MaruDao {
	ArrayList<MaruMember> selectMaruMemberList(int nmno) throws MaruException;
	
	MaruMember selectMaruMemberOne(int nmno, int mno);
	
	void insertMaruMember(MaruMember mm) throws MaruException;
	
	void deleteMaruMember(int nmno, int mno);

	int countMaruMember(int nmno) throws MaruException;

	ArrayList selectMaruList(int mno) throws MaruException;

	Narumaru selectOneMaru(int nmno) throws MaruException;

	int getMaruMaster(int nmno); 
}

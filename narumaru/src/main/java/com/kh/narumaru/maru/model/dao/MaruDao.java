package com.kh.narumaru.maru.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.narumaru.common.model.vo.PageInfo;
import com.kh.narumaru.maru.exception.MaruException;
import com.kh.narumaru.maru.exception.invateRejectException;
import com.kh.narumaru.maru.model.vo.MaruMember;
import com.kh.narumaru.member.model.vo.Member;
import com.kh.narumaru.narumaru.model.vo.InvateMember;
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

	int getInvitedMaruCount(SqlSessionTemplate sqlSession, int mno);

	ArrayList<InvateMember> selectInvitedMaruCount(SqlSessionTemplate sqlSession, PageInfo pi);

	void invateReject(SqlSessionTemplate sqlSession, int ino) throws invateRejectException; 
}

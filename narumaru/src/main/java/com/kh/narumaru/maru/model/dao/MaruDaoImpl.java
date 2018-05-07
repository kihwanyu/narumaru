package com.kh.narumaru.maru.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.narumaru.common.model.vo.PageInfo;
import com.kh.narumaru.maru.exception.MaruException;
import com.kh.narumaru.maru.exception.invateRejectException;
import com.kh.narumaru.maru.model.vo.MaruMember;
import com.kh.narumaru.narumaru.model.vo.InvateMember;
import com.kh.narumaru.narumaru.model.vo.Narumaru;

@Repository
public class MaruDaoImpl implements MaruDao{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<MaruMember> selectMaruMemberList(int nmno) throws MaruException {
		ArrayList maruMemberList = (ArrayList) sqlSession.selectList("Maru.selectMaruMemberList", nmno);
		if(maruMemberList==null){
			throw new MaruException("마루목록 조회 실패");
		}
		
		return maruMemberList;
	}

	@Override
	public MaruMember selectMaruMemberOne(int nmno, int mno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertMaruMember(MaruMember mm) throws MaruException {
		int check = sqlSession.selectOne("Maru.checkMaruMember", mm);
		if(check==0){
			int result = sqlSession.insert("Maru.insertMaruMember", mm);			
			if(result<0){
				throw new MaruException("마루 가입 실패");
			}
		}else{
			throw new MaruException("이미 가입된 회원입니다"); 
		}
		
	}

	@Override
	public void deleteMaruMember(int nmno, int mno) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int countMaruMember(int nmno) throws MaruException {
		int result = sqlSession.selectOne("Maru.countMaruMember", nmno);
		if(result>1){
			throw new MaruException("회원 수 조회 실패");
		}
		return result;
		
	}

	@Override
	public ArrayList selectMaruList(int mno) throws MaruException {
		ArrayList maruList = (ArrayList) sqlSession.selectList("Maru.selectMaruList", mno);
		if(maruList==null){
			throw new MaruException("마루목록 조회 실패");
		}
		return maruList;
	}

	@Override
	public Narumaru selectOneMaru(int nmno) throws MaruException {
		Narumaru mn = sqlSession.selectOne("Narumaru.selectNarumaruOne", nmno);
		System.out.println(mn);
		if(mn==null){
			throw new MaruException("마루 조회 실패");
		}
		return mn;
	}

	@Override
	public int getMaruMaster(int nmno) {
		int masterMno = sqlSession.selectOne("Maru.selectMasterMno", nmno);
		return masterMno;
	}

	@Override

	public int getInvitedMaruCount(SqlSessionTemplate sqlSession, int mno) {
		
		int count = 0;
		
		Integer result = sqlSession.selectOne("Maru.getInvitedMaruCount", mno);
		
		if(result != null){
			count = result;
		}
		
		return count;
	}

	@Override
	public ArrayList<InvateMember> selectInvitedMaruCount(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		ArrayList<InvateMember> list = (ArrayList)sqlSession.selectList("Maru.selectInvitedMaruList", pi, rowBounds);
		
		return list;
	}

	@Override
	public void invateReject(SqlSessionTemplate sqlSession, int ino) throws invateRejectException {
		
		int result = sqlSession.delete("Maru.invateReject",ino);
		
		if(result <= 0){
			throw new invateRejectException("초대 거절 실패");
		}
	}		

	public MaruMember insertInvatemember(int nmno, String email) throws MaruException {
		MaruMember mm = new MaruMember();
		mm.setMno(sqlSession.selectOne("Maru.selectOneMember", email));
		mm.setNmno(nmno);
		
		int result = sqlSession.insert("Maru.insertInvatemember", mm);
		if(result <0){
			throw new MaruException("회원 초대 실패");
		}
		return mm;
	}

	@Override
	public ArrayList selectInvateMemberList(int nmno) {
		ArrayList invateMemberList = (ArrayList) sqlSession.selectList("Maru.selectInvatemember", nmno);
		return invateMemberList;

	}

	@Override
	public void invateAccept(SqlSessionTemplate sqlSession, MaruMember m) throws invateRejectException {
		int result = sqlSession.insert("Maru.insertMaruMember", m);
		
		if(result <= 0){
			throw new invateRejectException("마루 가입 실패!");
		}
	}

	@Override
	public ArrayList<Integer> selectMaruMemberMno(SqlSessionTemplate sqlSession, MaruMember m) {
		
		ArrayList<Integer> result = (ArrayList) sqlSession.selectList("Maru.selectMaruMemberMno", m);
		
		return result;
	}

}

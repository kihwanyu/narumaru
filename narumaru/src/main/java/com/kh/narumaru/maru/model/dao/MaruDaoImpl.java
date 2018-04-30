package com.kh.narumaru.maru.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.narumaru.maru.exception.MaruException;
import com.kh.narumaru.maru.model.vo.MaruMember;
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

}

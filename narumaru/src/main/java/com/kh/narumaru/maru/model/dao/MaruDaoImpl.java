package com.kh.narumaru.maru.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.narumaru.maru.exception.MaruException;
import com.kh.narumaru.maru.model.vo.MaruMember;

@Repository
public class MaruDaoImpl implements MaruDao{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<MaruMember> selectMaruMemberList(int nmno) {
		// TODO Auto-generated method stub 
		return null;
	}

	@Override
	public MaruMember selectMaruMemberOne(int nmno, int mno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertMaruMember(MaruMember mm) throws MaruException {
		
		int result = sqlSession.insert("Maru.insertMaruMember", mm);
		if(result<0){
			throw new MaruException("마루 가입 실패");
		}
		
	}

	@Override
	public void deleteMaruMember(int nmno, int mno) {
		// TODO Auto-generated method stub
		
	}

}

package com.kh.narumaru.narumaru.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.narumaru.member.model.vo.Member;
import com.kh.narumaru.narumaru.exception.NarumaruException;
import com.kh.narumaru.narumaru.model.vo.Board;
import com.kh.narumaru.narumaru.model.vo.Category;
import com.kh.narumaru.narumaru.model.vo.Narumaru;

@Repository
public class NarumaruDaoImpl implements NarumaruDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Board> selectBoardList(int nmno) {
		
		ArrayList<Board> list = (ArrayList)sqlSession.selectList("Board.selectBoardList", nmno);
		
		System.out.println(list);
		
		return list;
	}

	@Override
	public ArrayList<Category> selectCategoryList(int nmno) {
		// TODO Auto-generated method stub
		return null; 
	}

	@Override
	public void insertCategory(int nmno, Category c) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteCategory(int nmno, int cano) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Narumaru insertNarumaru(SqlSessionTemplate sqlSession, Narumaru nm) throws NarumaruException {
		
		int result = sqlSession.insert("Narumaru.insertNarumaru", nm);
		if(result<0){
			throw new NarumaruException("생성 실패");
		}else{
			
		}
		return nm;
	}
	
	@Override
	public Narumaru selectNarumaruOne(int nmno) {
		
		Narumaru nm = (Narumaru)sqlSession.selectOne("Narumaru.selectNarumaruOne", nmno);
		
		System.out.println(nm);
		
		return nm;
	}

	@Override
	public boolean checkNarumaruOwner(int nmno, Member loginUser) {
		
		boolean isOwner = false;
		
		int ownerMno = sqlSession.selectOne("Narumaru.checkNarumaruOwner", nmno);
		
		System.out.println(loginUser);
		System.out.println(ownerMno);
		
		if(loginUser.getMid() == ownerMno) isOwner = true;
		
		return isOwner;
	}

}

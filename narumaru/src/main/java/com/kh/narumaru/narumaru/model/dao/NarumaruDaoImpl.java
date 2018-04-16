package com.kh.narumaru.narumaru.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public Narumaru selectNarumaruOne(int nmno) {
		
		Narumaru nm = (Narumaru)sqlSession.selectOne("Board.selectNarumaruOne", nmno);
		
		System.out.println("narumarudao : " + nm);
		
		return nm;
	}

}

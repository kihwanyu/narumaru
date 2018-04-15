package com.kh.narumaru.board.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.narumaru.board.model.vo.Board;

@Repository
public class BoardDaoImpl implements BoardDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Board> getBoardListAll(int nmno) {
		
		ArrayList<Board> list = (ArrayList)sqlSession.selectList("Board.selectBoardListAll", nmno);
		
		System.out.println(list);
		
		return list;
	}

}

package com.kh.narumaru.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

import com.kh.narumaru.board.model.dao.BoardDao;
import com.kh.narumaru.board.model.vo.Board;

public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDao bd;
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	@Override
	public ArrayList<Board> getBoardListAll(int nmno) {
		
		return bd.getBoardListAll(nmno);
	}
}

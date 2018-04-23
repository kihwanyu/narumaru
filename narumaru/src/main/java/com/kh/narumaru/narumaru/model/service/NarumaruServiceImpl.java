package com.kh.narumaru.narumaru.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;

import com.kh.narumaru.member.model.vo.Member;
import com.kh.narumaru.narumaru.exception.NarumaruException;
import com.kh.narumaru.narumaru.model.dao.NarumaruDao;
import com.kh.narumaru.narumaru.model.vo.Board;
import com.kh.narumaru.narumaru.model.vo.Category;
import com.kh.narumaru.narumaru.model.vo.Narumaru;

@Service
public class NarumaruServiceImpl implements NarumaruService {
	@Autowired
	private NarumaruDao nmd;
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	@Override
	public ArrayList<Board> selectBoardList(int nmno) {
		
		return nmd.selectBoardList(nmno);
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
	public Narumaru insertNarumaru(Narumaru nm) throws NarumaruException {
		return nmd.insertNarumaru(sqlSession, nm);	
		
	}
	
	@Override
	public Narumaru selectNarumaruOne(int nmno) {
		return nmd.selectNarumaruOne(nmno);
	}

	@Override
	public boolean checkNarumaruOwner(int nmno, Member loginUser) {
		return nmd.checkNarumaruOwner(nmno, loginUser);
	}

	@Override
	public Board insertNarumaruBoard(Board b) throws NarumaruException {
		return nmd.insertNarumaruBoard(sqlSession, b);	
		
	}

	@Override
	public Board selectBoardOne(int bno) {
		return nmd.selectBoardOne(bno);
	}

	@Override
	public Board updateBoardOne(Board b) throws NarumaruException {
		return nmd.updateBoardOne(sqlSession, b);
	}

	@Override
	public void deleteBoardOne(int bno) throws NarumaruException {
		nmd.deleteBoardOne(sqlSession, bno);
	}

	@Override
	public ArrayList<Board> selectCommentList(int nmno) {
		return nmd.selectCommentList(nmno);
	}

	@Override
	public void insertComment(Board b) throws NarumaruException {
		nmd.insertComment(sqlSession, b);
	}
}

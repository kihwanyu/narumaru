package com.kh.narumaru.narumaru.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.narumaru.member.model.vo.Member;
import com.kh.narumaru.naru.model.vo.Theme;
import com.kh.narumaru.narumaru.exception.NarumaruException;
import com.kh.narumaru.narumaru.model.vo.Board;
import com.kh.narumaru.narumaru.model.vo.Narumaru;

public interface NarumaruDao {

	ArrayList<Board> selectBoardList(int nmno);
	
	Narumaru insertNarumaru(SqlSessionTemplate sqlSession, Narumaru nm) throws NarumaruException;

	Narumaru selectNarumaruOne(int nmno);

	boolean checkNarumaruOwner(int nmno, Member loginUser);

	Board insertNarumaruBoard(SqlSessionTemplate sqlSession, Board b) throws NarumaruException;

	Board selectBoardOne(int bno);

	Board updateBoardOne(SqlSessionTemplate sqlSession, Board b) throws NarumaruException;

	void deleteBoardOne(SqlSessionTemplate sqlSession, int bno) throws NarumaruException;

	ArrayList<Board> selectCommentList(int nmno);

	void insertComment(SqlSessionTemplate sqlSession, Board b) throws NarumaruException;

	int selectNarumaruType(int nmno);

	ArrayList<Board> selectWritedBoardList(int mid);

	ArrayList<Board> selectWritedCommentList(int mid);

	ArrayList<Board> selectCommentListAll();

	Theme selectThemeOne(int nmno);

	int getBoardWriter(Board b);
  
	void updateDefault(Narumaru nm, SqlSessionTemplate sqlSession);

	int checkNeighbor(int nmno, Member loginUser);
} 

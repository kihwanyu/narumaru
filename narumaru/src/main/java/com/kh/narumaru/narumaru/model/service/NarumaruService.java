package com.kh.narumaru.narumaru.model.service;

import java.util.ArrayList;

import com.kh.narumaru.member.model.vo.Member;
import com.kh.narumaru.naru.model.vo.Theme;
import com.kh.narumaru.narumaru.exception.NarumaruException;
import com.kh.narumaru.narumaru.model.vo.Board;
import com.kh.narumaru.narumaru.model.vo.Narumaru;

public interface NarumaruService {

	ArrayList<Board> selectBoardList(int nmno);
	
	Narumaru insertNarumaru(Narumaru nm) throws NarumaruException;

	Narumaru selectNarumaruOne(int nmno);

	boolean checkNarumaruOwner(int nmno, Member loginUser);

	Board insertNarumaruBoard(Board b) throws NarumaruException;

	Board selectBoardOne(int bno);

	Board updateBoardOne(Board b) throws NarumaruException;

	void deleteBoardOne(int bno) throws NarumaruException;

	ArrayList<Board> selectCommentList(int nmno);

	void insertComment(Board b) throws NarumaruException;

	int selectNarumaruType(int nmno);

	ArrayList<Board> selectWritedBoardList(int mid);

	ArrayList<Board> selectWritedCommentList(int mid);


	ArrayList<Board> selectCommentListAll();

	Theme selectThemeOne(int nmno);

	int getBoardWriter(Board b); 

	void updateDefault(Narumaru nm);

	int checkNeighbor(int nmno, Member loginUser);

	ArrayList<Board> searchBoard(Board b); 
}

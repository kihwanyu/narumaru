package com.kh.narumaru.narumaru.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.narumaru.member.model.vo.Member;
import com.kh.narumaru.narumaru.exception.NarumaruException;
import com.kh.narumaru.narumaru.model.vo.Board;
import com.kh.narumaru.narumaru.model.vo.Category;
import com.kh.narumaru.narumaru.model.vo.Narumaru;

public interface NarumaruDao {

	ArrayList<Board> selectBoardList(int nmno);
	
	ArrayList<Category> selectCategoryList(int nmno);

	void insertCategory(int nmno, Category c);
	
	void deleteCategory(int nmno, int cano);

	Narumaru insertNarumaru(SqlSessionTemplate sqlSession, Narumaru nm) throws NarumaruException;

	Narumaru selectNarumaruOne(int nmno);

	boolean checkNarumaruOwner(int nmno, Member loginUser);
} 

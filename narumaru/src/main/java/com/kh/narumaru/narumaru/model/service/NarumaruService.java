package com.kh.narumaru.narumaru.model.service;

import java.util.ArrayList;

import com.kh.narumaru.narumaru.model.vo.Board;
import com.kh.narumaru.narumaru.model.vo.Category;
import com.kh.narumaru.narumaru.model.vo.Narumaru;

public interface NarumaruService {

	ArrayList<Board> selectBoardList(int nmno);
	
	ArrayList<Category> selectCategoryList(int nmno);

	void insertCategory(int nmno, Category c);
	
	void deleteCategory(int nmno, int cano);

	Narumaru selectNarumaruOne(int nmno);
}

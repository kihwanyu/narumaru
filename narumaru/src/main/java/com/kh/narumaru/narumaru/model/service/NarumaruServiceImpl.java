package com.kh.narumaru.narumaru.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;

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
	public Narumaru selectNarumaruOne(int nmno) {
		return nmd.selectNarumaruOne(nmno);
	}
}

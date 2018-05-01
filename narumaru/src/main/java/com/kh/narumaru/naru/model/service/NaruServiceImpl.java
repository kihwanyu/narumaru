package com.kh.narumaru.naru.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;

import com.kh.narumaru.naru.model.dao.NaruDao;
import com.kh.narumaru.naru.model.exception.NaruException;
import com.kh.narumaru.naru.model.vo.Category;
import com.kh.narumaru.narumaru.model.vo.Narumaru;

@Service
public class NaruServiceImpl implements NaruService{
	@Autowired
	private NaruDao nd;
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	@Override
	public void insertCategory(String s, int nmno) throws NaruException {
		nd.insertCategory(s, nmno, sqlSession);
	}

	@Override
	public ArrayList<Category> selectCategoryList(int nmno) {
		return nd.selectCategoryList(sqlSession, nmno);
	}

	@Override
	public void disableCategory(String caName, int nmno) {
		nd.disableCategory(sqlSession, caName, nmno);
	}

	@Override
	public void updateTheme(int nmno, String themeValue, String boardValue, String fontValue) {
		nd.updateTheme(nmno, themeValue, boardValue, fontValue, sqlSession);
	}

	@Override
	public void insertNeighbor(int nmno, int mid) {
		nd.insertNeighbor(nmno, mid, sqlSession);
	}

	@Override
	public ArrayList<Narumaru> selectNeighborList(int nmno) {
		return nd.selectNeighborList(nmno, sqlSession);
	}

	@Override
	public void deleteNeighbor(int nmno, int mid) {
		nd.deleteNeighbor(nmno, mid, sqlSession);
	}

}

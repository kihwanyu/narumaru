package com.kh.narumaru.naru.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;

import com.kh.narumaru.naru.model.dao.NaruDao;
import com.kh.narumaru.naru.model.exception.NaruException;

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

}

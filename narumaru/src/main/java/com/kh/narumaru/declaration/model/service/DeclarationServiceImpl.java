package com.kh.narumaru.declaration.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.narumaru.declaration.model.dao.DeclarationDao;

@Service
public class DeclarationServiceImpl implements DeclarationService {
	@Autowired
	private DeclarationDao dd;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public void reportBoardOne(int mno, int bno, String reason, int nmno) {
		dd.reportBoardOne(mno, bno, reason, nmno, sqlSession);
	}
}

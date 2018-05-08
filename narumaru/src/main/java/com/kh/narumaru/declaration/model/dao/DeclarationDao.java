package com.kh.narumaru.declaration.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

public interface DeclarationDao {

	void reportBoardOne(int mno, int bno, String reason, int nmno, SqlSessionTemplate sqlSession);
}

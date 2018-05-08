package com.kh.narumaru.declaration.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.narumaru.declaration.model.vo.Declaration;

@Repository
public class DelcarationDaoImpl implements DeclarationDao{
	
	@Override
	public void reportBoardOne(int mno, int bno, String reason, int nmno, SqlSessionTemplate sqlSession) {
		Declaration d = new Declaration();
		
		d.setMno(mno);
		d.setBno(bno);
		d.setPolIu(reason);
		d.setNmno(nmno);
		
		sqlSession.insert("Declaration.insertDeclaration", d);
		
	}
}

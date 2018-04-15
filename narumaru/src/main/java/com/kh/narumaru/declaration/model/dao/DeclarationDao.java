package com.kh.narumaru.declaration.model.dao;

import java.util.ArrayList;

import com.kh.narumaru.declaration.model.vo.Declaration;

public interface DeclarationDao {
	ArrayList<Declaration> selectDeclarationList(); //신고목록 전체조회
	
	Declaration selectDeclarationOne(int polNo); //신고목록 한건조회
	
	void insertDeclaration(Declaration d); // 신고목록 추가
	
	void deleteDeclaration(int polNo); //신고목록 삭제
}

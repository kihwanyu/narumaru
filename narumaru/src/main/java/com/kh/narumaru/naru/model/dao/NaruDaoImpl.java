package com.kh.narumaru.naru.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.narumaru.naru.model.exception.NaruException;
import com.kh.narumaru.naru.model.vo.Category;

@Repository
public class NaruDaoImpl implements NaruDao{

	@Override
	public void insertCategory(String s, int nmno, SqlSessionTemplate sqlSession) throws NaruException {
		Category c = new Category();
		c.setCaName(s);
		c.setNmno(nmno);
		c.setCaLevel(0);

		//존재하는지 체크한다
		ArrayList<Category> clist = (ArrayList) sqlSession.selectList("Naru.selectCategoryAll", nmno);
		
		for(Category ca : clist){
			if(ca.getCaName().equals(s)){
				sqlSession.update("Naru.restoreCategory", ca.getCano());
				return;
			}
		}
		
		//없으면 카테고리를 추가한다
		int result = sqlSession.insert("Naru.insertCategory", c);
		
		if(result<0){
			throw new NaruException("생성 실패");
		}else{
			
		}
	}

	@Override
	public ArrayList<Category> selectCategoryList(SqlSessionTemplate sqlSession, int nmno) {
		
		ArrayList<Category> list = (ArrayList) sqlSession.selectList("Naru.selectCategoryAll", nmno);
		
		return list;
	}

	@Override
	public void disableCategory(SqlSessionTemplate sqlSession, String caName, int nmno) {
		Category c = new Category();
		c.setCaName(caName);
		c.setNmno(nmno);
		int result = sqlSession.update("Naru.disableCategory",c);
		
		if(result <= 0){
			System.out.println("해당하는 카테고리 없음");
		}
	}

}

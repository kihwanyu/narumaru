package com.kh.narumaru.naru.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.narumaru.naru.model.exception.NaruException;
import com.kh.narumaru.naru.model.vo.Category;

public interface NaruDao {

	void insertCategory(String s, int nmno, SqlSessionTemplate sqlSession) throws NaruException;

	ArrayList<Category> selectCategoryList(SqlSessionTemplate sqlSession, int nmno);

	void disableCategory(SqlSessionTemplate sqlSession, String caName, int nmno);

	void updateTheme(int nmno, String themeValue, String boardValue, String fontValue, SqlSessionTemplate sqlSession);

}

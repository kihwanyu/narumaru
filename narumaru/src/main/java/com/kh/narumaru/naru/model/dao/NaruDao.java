package com.kh.narumaru.naru.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.narumaru.naru.model.exception.NaruException;

public interface NaruDao {

	void insertCategory(String s, int nmno, SqlSessionTemplate sqlSession) throws NaruException;

}

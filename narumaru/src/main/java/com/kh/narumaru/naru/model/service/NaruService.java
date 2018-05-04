package com.kh.narumaru.naru.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.narumaru.naru.model.exception.NaruException;
import com.kh.narumaru.naru.model.vo.Category;
import com.kh.narumaru.narumaru.model.vo.Narumaru;

public interface NaruService {

	void insertCategory(String s, int nmno) throws NaruException;

	ArrayList<Category> selectCategoryList(int nmno);

	void disableCategory(String caName, int nmno);

	void updateTheme(int nmno, String themeValue, String boardValue, String fontValue);

	int insertNeighbor(int nmno, int mid);

	ArrayList<Narumaru> selectNeighborList(int nmno);

	void deleteNeighbor(int nmno, int mid);

}

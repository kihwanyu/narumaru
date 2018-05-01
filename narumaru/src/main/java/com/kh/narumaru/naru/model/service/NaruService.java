package com.kh.narumaru.naru.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.narumaru.naru.model.exception.NaruException;
import com.kh.narumaru.naru.model.vo.Category;

public interface NaruService {

	void insertCategory(String s, int nmno) throws NaruException;

	ArrayList<Category> selectCategoryList(int nmno);

	void disableCategory(String caName, int nmno);

	void updateTheme(int nmno, String themeValue, String boardValue, String fontValue);

	void insertNeighbor(int nmno, int mid);

}

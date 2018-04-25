package com.kh.narumaru.naru.model.service;

import org.springframework.stereotype.Service;

import com.kh.narumaru.naru.model.exception.NaruException;

public interface NaruService {

	void insertCategory(String s, int nmno) throws NaruException;

}

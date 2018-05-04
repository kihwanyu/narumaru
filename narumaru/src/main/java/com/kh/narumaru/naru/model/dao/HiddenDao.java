package com.kh.narumaru.naru.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.narumaru.naru.model.vo.HiddenPayment;

public interface HiddenDao {

	ArrayList<HiddenPayment> selectHiddenPaymentList(int mno, SqlSessionTemplate sqlSession);

}

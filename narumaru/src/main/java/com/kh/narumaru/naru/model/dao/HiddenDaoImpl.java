package com.kh.narumaru.naru.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.narumaru.naru.model.vo.HiddenPayment;

@Repository
public class HiddenDaoImpl implements HiddenDao {

	@Override
	public ArrayList<HiddenPayment> selectHiddenPaymentList(int mno, SqlSessionTemplate sqlSession) {
		ArrayList<HiddenPayment> list = (ArrayList)sqlSession.selectList("Hidden.selectHiddenPaymentList", mno);
		return list;
	}}

package com.kh.narumaru.payment.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

import com.kh.narumaru.payment.model.exception.PaymentInsertException;
import com.kh.narumaru.payment.model.vo.Payment;

public interface PaymentDao {

	int paymentInsert(SqlSession sqlSession, Payment p) throws PaymentInsertException;

	int myPointInquiry(SqlSessionTemplate sqlSession, Payment p) throws PaymentInsertException;
}

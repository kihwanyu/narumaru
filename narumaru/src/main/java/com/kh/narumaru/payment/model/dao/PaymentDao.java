package com.kh.narumaru.payment.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

import com.kh.narumaru.common.model.vo.PageInfo;
import com.kh.narumaru.payment.model.exception.PaymentInsertException;
import com.kh.narumaru.payment.model.exception.PaymentListSelectException;
import com.kh.narumaru.payment.model.exception.WithdrawListSelectException;
import com.kh.narumaru.payment.model.exception.refundInsertException;
import com.kh.narumaru.payment.model.vo.Payment;
import com.kh.narumaru.payment.model.vo.Withdraw;

public interface PaymentDao {

	int paymentInsert(SqlSession sqlSession, Payment p) throws PaymentInsertException;

	int myPointInquiry(SqlSessionTemplate sqlSession, Payment p) throws PaymentInsertException;

	int getPaymentListCount(SqlSessionTemplate sqlSession, int mno) throws PaymentListSelectException;

	ArrayList<Payment> selectPaymentList(SqlSessionTemplate sqlSession, PageInfo pi) throws PaymentListSelectException;

	int myPointInquiry(SqlSessionTemplate sqlSession, int mno) throws PaymentListSelectException;

	void refundInsert(SqlSessionTemplate sqlSession, Withdraw w) throws refundInsertException;

	int getRefundListCount(SqlSessionTemplate sqlSession, int mno);

	ArrayList<Withdraw> selectWithdrawList(SqlSessionTemplate sqlSession, PageInfo pi);

	void deleteWithdraw(SqlSessionTemplate sqlSession, int wno) throws WithdrawListSelectException;
	
	
}

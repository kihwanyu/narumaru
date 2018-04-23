package com.kh.narumaru.payment.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.narumaru.common.vo.PageInfo;
import com.kh.narumaru.payment.model.exception.PaymentInsertException;
import com.kh.narumaru.payment.model.exception.PaymentListSelectException;
import com.kh.narumaru.payment.model.vo.Payment;

@Repository
public class PaymentDaoImpl implements PaymentDao {

	@Override
	public int paymentInsert(SqlSession sqlSession, Payment p) throws PaymentInsertException {
		
		int result = sqlSession.insert("Payment.paymentInsert",p);
		
		if(result <= 0){
			throw new PaymentInsertException("결제 등록 실패!");
		}
		
		return result;
	}

	@Override
	public int myPointInquiry(SqlSessionTemplate sqlSession, Payment p) throws PaymentInsertException {
		int result = sqlSession.selectOne("Payment.myPointInquiry", p);
		
		return result;
	}

	@Override
	public int getPaymentListCount(SqlSessionTemplate sqlSession, int mno) throws PaymentListSelectException {
		int result = 0;
		// 결제 내역이 없을 경우. CHAEK 하기위해서 이용.
		Payment paymentResult = sqlSession.selectOne("Payment.selectPayment",mno);
		if(paymentResult != null){
			result = sqlSession.selectOne("Payment.selectPaymentListCount",mno);
		} 
		
		return result;
	}

	@Override
	public ArrayList<Payment> selectPaymentList(SqlSessionTemplate sqlSession, PageInfo pi) throws PaymentListSelectException {
		int result = 0;
		ArrayList<Payment> pList = null;
		// 결제 내역이 없을 경우. CHAEK 하기위해서 이용.
		Payment paymentResult = sqlSession.selectOne("Payment.selectPayment", pi);
		
		if(paymentResult != null){
			int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
			RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
			
			pList = (ArrayList) sqlSession.selectList("Payment.selectPaymentList", pi, rowBounds);
		} 
		
		return pList;
	}

	@Override
	public int myPointInquiry(SqlSessionTemplate sqlSession, int mno) throws PaymentListSelectException {
		int result = 0;
		// 결제 내역이 없을 경우. CHAEK 하기위해서 이용.
		Payment paymentResult = sqlSession.selectOne("Payment.selectPayment",mno);
		System.out.println("paymentResult : "+paymentResult);
		if(paymentResult != null){
			result = sqlSession.selectOne("Payment.myPointInquiry", mno);
		} 
		return result;
	}

}

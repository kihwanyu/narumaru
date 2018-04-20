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
		
		int result = sqlSession.selectOne("Payment.selectPaymentListCount",mno);
		
		if(result <= 0){
			throw new PaymentListSelectException("결제 목록 조회 실패 - COUNT");
		}
		
		return result;
	}

	@Override
	public ArrayList<Payment> selectPaymentList(SqlSessionTemplate sqlSession, PageInfo pi) throws PaymentListSelectException {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		ArrayList<Payment> pList = (ArrayList) sqlSession.selectList("Payment.selectPaymentList", pi, rowBounds);
		
		if(pList == null){
			throw new PaymentListSelectException("결제 목록 조회 실패 - LIST");
		}
		
		return pList;
	}

	@Override
	public int myPointInquiry(SqlSessionTemplate sqlSession, int mno) {
		int result = sqlSession.selectOne("Payment.myPointInquiry", mno);
		
		return result;
	}

}

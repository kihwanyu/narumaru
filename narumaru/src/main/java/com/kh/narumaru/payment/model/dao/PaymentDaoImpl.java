package com.kh.narumaru.payment.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.narumaru.payment.model.exception.PaymentInsertException;
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
		
		if(result == 0){
			throw new PaymentInsertException("포인트 조회 실패!");
		}
		
		return result;
	}

}

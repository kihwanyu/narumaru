package com.kh.narumaru.payment.model.dao;

import org.apache.ibatis.session.SqlSession;
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

}

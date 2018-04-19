package com.kh.narumaru.payment.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.narumaru.payment.model.dao.PaymentDao;
import com.kh.narumaru.payment.model.exception.PaymentInsertException;
import com.kh.narumaru.payment.model.vo.Payment;

@Service
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	private PaymentDao pd;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int PaymentInsert(Payment p) throws PaymentInsertException {
		
		int result = pd.paymentInsert(sqlSession, p);
		
		if(result > 0){
			result = pd.myPointInquiry(sqlSession, p);
		}
		
		return result;
	}

}

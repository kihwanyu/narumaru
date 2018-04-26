package com.kh.narumaru.payment.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.narumaru.common.vo.PageInfo;
import com.kh.narumaru.payment.model.dao.PaymentDao;
import com.kh.narumaru.payment.model.exception.PaymentInsertException;
import com.kh.narumaru.payment.model.exception.PaymentListSelectException;
import com.kh.narumaru.payment.model.exception.refundInsertException;
import com.kh.narumaru.payment.model.vo.Payment;
import com.kh.narumaru.payment.model.vo.Withdraw;

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

	@Override
	public int getPaymentListCount(int mno) throws PaymentListSelectException {
		
		int listCount = pd.getPaymentListCount(sqlSession, mno);
		
		return listCount;
	}

	@Override
	public ArrayList<Payment> selectPaymentList(PageInfo pi) throws PaymentListSelectException {

		ArrayList<Payment> plist = pd.selectPaymentList(sqlSession, pi);

		return plist;
	}

	@Override
	public int selectTotalPoint(int mno) throws PaymentListSelectException {
		
		int totalPoint = pd.myPointInquiry(sqlSession, mno);
		
		return totalPoint;
	}

	@Override
	public void refundInsert(Withdraw w) throws refundInsertException {
		
		pd.refundInsert(sqlSession, w);
	}

}

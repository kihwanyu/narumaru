package com.kh.narumaru.payment.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.narumaru.common.vo.PageInfo;
import com.kh.narumaru.payment.model.exception.PaymentInsertException;
import com.kh.narumaru.payment.model.exception.PaymentListSelectException;
import com.kh.narumaru.payment.model.exception.WithdrawListSelectException;
import com.kh.narumaru.payment.model.exception.refundInsertException;
import com.kh.narumaru.payment.model.vo.Payment;
import com.kh.narumaru.payment.model.vo.Withdraw;

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
		int myPaymentPoint = sqlSession.selectOne("Payment.myPaymentPointInquiry", p);
		int myRefundPoint = sqlSession.selectOne("Payment.myRefundPointInquiry", p);
		int result = myPaymentPoint - myRefundPoint;
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
		int myPaymentPoint = 0;
		int myRefundPoint = 0;
		// 결제 내역이 없을 경우. CHAEK 하기위해서 이용.
		Payment paymentResult = sqlSession.selectOne("Payment.selectPayment",mno);
		Withdraw withdrawResult = sqlSession.selectOne("Payment.selectRefund",mno);
		System.out.println("paymentResult : "+paymentResult);
		if(paymentResult != null){
			myPaymentPoint = sqlSession.selectOne("Payment.myPaymentPointInquiry", mno);
		} 
		if(withdrawResult != null){
			myRefundPoint = sqlSession.selectOne("Payment.myRefundPointInquiry", mno);
		}
		result = myPaymentPoint - myRefundPoint;
		return result;
	}

	@Override
	public void refundInsert(SqlSessionTemplate sqlSession, Withdraw w) throws refundInsertException {
		
		int result = sqlSession.insert("Payment.refundInsert", w);
		
		if(result <= 0){
				throw new refundInsertException("환급 신청 실패 - INSERT");
		}
	}

	@Override
	public int getRefundListCount(SqlSessionTemplate sqlSession, int mno) {
		int result = 0;
		// 환급내역 없을 경우. CHAEK 하기위해서 이용.
		Withdraw paymentResult = sqlSession.selectOne("Payment.selectRefund",mno);
		if(paymentResult != null){
			result = sqlSession.selectOne("Payment.selectRefundListCount",mno);
		} 
		
		return result;
	}

	@Override
	public ArrayList<Withdraw> selectWithdrawList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int result = 0;
		ArrayList<Withdraw> wList = null;
		// 결제 내역이 없을 경우. CHAEK 하기위해서 이용.
		Withdraw paymentResult = sqlSession.selectOne("Payment.selectRefund", pi);
		
		if(paymentResult != null){
			int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
			RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
			
			wList = (ArrayList) sqlSession.selectList("Payment.selectRefundList", pi, rowBounds);
		} 
		
		return wList;
	}

	@Override
	public void deleteWithdraw(SqlSessionTemplate sqlSession, int wno) throws WithdrawListSelectException {
		int result = sqlSession.delete("Payment.deleteWithdraw", wno);
		
		if(result <= 0){
			throw new WithdrawListSelectException("환급 취소 에러!!");
		}
		
	}

}

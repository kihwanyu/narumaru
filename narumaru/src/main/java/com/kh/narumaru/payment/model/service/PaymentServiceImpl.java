package com.kh.narumaru.payment.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.narumaru.common.model.vo.PageInfo;
import com.kh.narumaru.payment.model.dao.PaymentDao;
import com.kh.narumaru.payment.model.dao.UsePointDao;
import com.kh.narumaru.payment.model.exception.PaymentInsertException;
import com.kh.narumaru.payment.model.exception.PaymentListSelectException;
import com.kh.narumaru.payment.model.exception.WithdrawListSelectException;
import com.kh.narumaru.payment.model.exception.refundInsertException;
import com.kh.narumaru.payment.model.vo.Payment;
import com.kh.narumaru.payment.model.vo.Stats;
import com.kh.narumaru.payment.model.vo.UsePoint;
import com.kh.narumaru.payment.model.vo.Withdraw;

@Service
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	private PaymentDao pd;
	@Autowired
	private UsePointDao up;
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

	@Override
	public int getRefundListCount(int mno) {
		
		int listCount = pd.getRefundListCount(sqlSession, mno);
		
		return listCount;
	}

	@Override
	public ArrayList<Withdraw> selectWithdrawList(PageInfo pi) {
		ArrayList<Withdraw> wlist = pd.selectWithdrawList(sqlSession, pi);

		return wlist;
	}

	@Override
	public void deleteWithdraw(int wno) throws WithdrawListSelectException {
		pd.deleteWithdraw(sqlSession, wno);
	}

	@Override
	public int getUsingHistoryListCount(int mno) {
		
		int count = up.getUsingHistoryListCount(sqlSession, mno);
		
		return count;
	}

	@Override
	public ArrayList<UsePoint> selectUsingHistoryList(PageInfo pi) {
		
		ArrayList<UsePoint> uList = up.selectUseHistoryList(sqlSession, pi);
		
		return uList;
	}

	@Override
	public int getUserPointTotal(int mno) {
		
		int result = up.getUserPointTotal(sqlSession, mno);
		
		return result;
	}

	@Override
	public int getRevenueListCount(int mno) {

		int count = up.getRevenueListCount(sqlSession, mno);
		
		return count;
	}

	@Override
	public ArrayList<UsePoint> selectRevenueList(PageInfo pi) {

		ArrayList<UsePoint> uList = up.selectRevenueList(sqlSession, pi);
		
		return uList;
	}

	@Override
	public ArrayList<String> getBeingYearList(int mno) {
		
		ArrayList<String> list = up.getBeingYearList(sqlSession,mno);
		
		return list;
	}

	@Override
	public ArrayList<Stats> selectYearMonthRevenueStats(Stats s) {
		
		ArrayList<Stats> list = up.selectYearMonthRevenueStats(sqlSession, s);
		
		return list;
	}

	@Override
	public int getRevenueTotalPoint(int mno) {
		
		int result = up.getRevenueTotalPoint(sqlSession, mno);
		
		return result;
	}

}

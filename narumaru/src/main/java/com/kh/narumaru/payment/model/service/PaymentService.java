package com.kh.narumaru.payment.model.service;

import java.util.ArrayList;

import com.kh.narumaru.common.model.vo.PageInfo;
import com.kh.narumaru.payment.model.exception.PaymentInsertException;
import com.kh.narumaru.payment.model.exception.PaymentListSelectException;
import com.kh.narumaru.payment.model.exception.WithdrawListSelectException;
import com.kh.narumaru.payment.model.exception.refundInsertException;
import com.kh.narumaru.payment.model.vo.Payment;
import com.kh.narumaru.payment.model.vo.Withdraw;

public interface PaymentService {

	int PaymentInsert(Payment p) throws PaymentInsertException;

	int getPaymentListCount(int mno) throws PaymentListSelectException;

	ArrayList<Payment> selectPaymentList(PageInfo pi) throws PaymentListSelectException;

	int selectTotalPoint(int mno) throws PaymentListSelectException;

	void refundInsert(Withdraw w) throws refundInsertException;

	int getRefundListCount(int mno);

	ArrayList<Withdraw> selectWithdrawList(PageInfo pi);

	void deleteWithdraw(int wno) throws WithdrawListSelectException;
}

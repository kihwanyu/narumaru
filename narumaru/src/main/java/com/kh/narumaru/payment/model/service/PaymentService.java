package com.kh.narumaru.payment.model.service;

import java.util.ArrayList;

import com.kh.narumaru.common.vo.PageInfo;
import com.kh.narumaru.payment.model.exception.PaymentInsertException;
import com.kh.narumaru.payment.model.exception.PaymentListSelectException;
import com.kh.narumaru.payment.model.vo.Payment;

public interface PaymentService {

	int PaymentInsert(Payment p) throws PaymentInsertException;

	int getPaymentListCount(int mno) throws PaymentListSelectException;

	ArrayList<Payment> selectPaymentList(PageInfo pi) throws PaymentListSelectException;
}

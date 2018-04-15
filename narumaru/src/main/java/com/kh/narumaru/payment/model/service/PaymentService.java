package com.kh.narumaru.payment.model.service;

import java.util.ArrayList;

import com.kh.narumaru.payment.model.vo.Payment;

public interface PaymentService {
	ArrayList<Payment> selectPaymentList(); // 결제목록 전체조회
	
	Payment selectPaymentOne(int payNo); // 결제목록 한건조회
	
	void insertPayment(Payment d); // 결제목록 추가
	
	void deletePayment(int polNo); // 결제목록 삭제
}

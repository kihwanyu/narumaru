package com.kh.narumaru.payment.model.service;

import java.util.ArrayList;

import com.kh.narumaru.payment.model.exception.PaymentInsertException;
import com.kh.narumaru.payment.model.vo.Payment;

public interface PaymentService {

	int PaymentInsert(Payment p) throws PaymentInsertException;
}

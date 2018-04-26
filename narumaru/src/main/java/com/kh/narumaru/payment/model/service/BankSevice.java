package com.kh.narumaru.payment.model.service;

import java.util.ArrayList;

import com.kh.narumaru.payment.model.exception.BankSelectAllException;
import com.kh.narumaru.payment.model.vo.Bank;

public interface BankSevice {

	ArrayList<Bank> selectAllBankList() throws BankSelectAllException;

}

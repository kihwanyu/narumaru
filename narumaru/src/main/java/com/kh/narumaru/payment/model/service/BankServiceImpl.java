package com.kh.narumaru.payment.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.narumaru.payment.model.dao.BankDao;
import com.kh.narumaru.payment.model.exception.BankSelectAllException;
import com.kh.narumaru.payment.model.vo.Bank;

@Service
public class BankServiceImpl implements BankSevice{
	@Autowired
	BankDao bd;
	@Autowired
	SqlSessionTemplate sqlSession;
	@Override
	public ArrayList<Bank> selectAllBankList() throws BankSelectAllException {
		
		ArrayList<Bank> bankList = bd.selectAllBankList(sqlSession);
		
		return bankList;
	}

}

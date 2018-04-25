package com.kh.narumaru.payment.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.narumaru.payment.model.exception.BankSelectAllException;
import com.kh.narumaru.payment.model.vo.Bank;

@Repository
public class BankDaoImpl implements BankDao {

	@Override
	public ArrayList<Bank> selectAllBankList(SqlSessionTemplate sqlSession) throws BankSelectAllException {
		
		ArrayList<Bank> bankList = (ArrayList)sqlSession.selectList("Payment.selectAllBankList");
		
		if (bankList == null) {
			throw new BankSelectAllException("은행 목록 조회 에러!");
		}
		
		return bankList;
	}

}

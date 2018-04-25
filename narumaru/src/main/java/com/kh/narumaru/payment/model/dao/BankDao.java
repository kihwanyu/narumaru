package com.kh.narumaru.payment.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.narumaru.payment.model.exception.BankSelectAllException;
import com.kh.narumaru.payment.model.vo.Bank;

public interface BankDao {

	ArrayList<Bank> selectAllBankList(SqlSessionTemplate sqlSession) throws BankSelectAllException;

}

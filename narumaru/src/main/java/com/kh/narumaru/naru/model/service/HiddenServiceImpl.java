package com.kh.narumaru.naru.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;

import com.kh.narumaru.naru.model.dao.HiddenDao;
import com.kh.narumaru.naru.model.vo.HiddenPayment;

@Service
public class HiddenServiceImpl implements HiddenService{
	@Autowired
	private HiddenDao hd;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	@Override
	public ArrayList<HiddenPayment> selectHiddenPaymentList(int mno) {
		return hd.selectHiddenPaymentList(mno, sqlSession);
	}

}

package com.kh.narumaru.admin.model.service;

import java.util.Date;
import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.narumaru.admin.model.dao.AdminDao;


@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDao ad;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Date> selectEnrollDateList() {
		System.out.println("나오니?");
		System.out.println(ad);
		ArrayList<Date> list = ad.selectEnrollDateList();
		
		return list;
	}

}

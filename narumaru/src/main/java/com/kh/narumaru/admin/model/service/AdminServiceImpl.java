package com.kh.narumaru.admin.model.service;


import java.util.Date;
import java.util.HashMap;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.narumaru.admin.model.dao.AdminDao;
import com.kh.narumaru.admin.model.vo.Admin;
import com.kh.narumaru.notice.model.vo.Notice;
import com.kh.narumaru.member.model.vo.Member;
@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao ad;
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Admin> showTotalView(ArrayList<Admin> a) {
		System.out.println("adminServiceImpl");
		
		ArrayList<Admin> result1 = ad.showTotalMemberView(a);
		
		System.out.println(result1);
				
		return result1;
	}

	@Override
	public void insertNotice(Notice n) {
		int result = ad.insertNotice(sqlSession, n);
  }
	
	@Override
	public HashMap selectEnrollDateList() {
		System.out.println("나오니?");
		System.out.println(ad);
		HashMap list = ad.selectEnrollDateList();
		
		return list;
	}

}

package com.kh.narumaru.admin.model.dao;

import java.util.Date;
import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.narumaru.member.model.vo.Member;

@Repository
public class AdminDaoImpl implements AdminDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public ArrayList<Date> selectEnrollDateList() {
		System.out.println("너는 나오니?");
		
		ArrayList<Date> list = (ArrayList)sqlSession.selectList("Admin.selectEnroll");
		
		System.out.println(list);
		
		return list;
	}

}

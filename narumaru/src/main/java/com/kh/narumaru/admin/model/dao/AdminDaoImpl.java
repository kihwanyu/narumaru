package com.kh.narumaru.admin.model.dao;

import java.util.Date;
import java.util.HashMap;
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
	public HashMap selectEnrollDateList() {
		System.out.println("너는 나오니?");
		
		ArrayList list1 = (ArrayList)sqlSession.selectList("Admin.selectEnroll1");
		
		ArrayList list2 = (ArrayList)sqlSession.selectList("Admin.selectEnroll2");
		System.out.println(list1);
		System.out.println(list2);
		
		HashMap hmap = new HashMap();
		hmap.put("date", list2);
		hmap.put("count", list1);
		
		return hmap;
	}

}

package com.kh.narumaru.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.narumaru.admin.model.vo.Admin;
import com.kh.narumaru.notice.model.vo.Notice;

@Repository
public class AdminDaoImpl implements AdminDao{
	@Autowired
	private SqlSessionTemplate sqlSession;


	@Override
	public ArrayList<Admin> showTotalMemberView(ArrayList<Admin> a) {
		System.out.println("AdminDao showTotalView ");
		ArrayList<Admin> alist = null;
		
		alist = (ArrayList)sqlSession.selectList("Member.showTotalMember");
		
		System.out.println(alist);
		
		
		return alist;
	}


	@Override
	public int insertNotice(SqlSessionTemplate sqlSession, Notice n) {
		System.out.println("insertNotice Dao : " + n );
		return sqlSession.insert("Board.insertNotice");
	}



}

package com.kh.narumaru.admin.model.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.narumaru.admin.model.vo.Admin;
import com.kh.narumaru.notice.model.vo.Notice;
import com.kh.narumaru.member.model.vo.Member;
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
  
  @Override
	public HashMap selectEnrollDateList() {
		
		
		ArrayList list1 = (ArrayList)sqlSession.selectList("Admin.selectEnroll1");
		
		ArrayList list2 = (ArrayList)sqlSession.selectList("Admin.selectEnroll2");
		System.out.println(list1);
		System.out.println(list2);
		
		HashMap hmap = new HashMap();
		hmap.put("date", list2);
		hmap.put("count", list1);
		
		return hmap;
	}

  @Override
  public ArrayList<Member> memberList() {
	  System.out.println("너는 나오니?");
	  
	  ArrayList<Member> member = (ArrayList)sqlSession.selectList("Admin.memberList1");
	  System.out.println(member);
	  
	  
	return member;
  }

  @Override
  public Member memberRevenue() {
	  System.out.println("나오는거지?");
	  
	  Member member = (Member) sqlSession.selectList("Admin.memberRevenue");
	  System.out.println(member);
	  
	 return member; 
  }
}

package com.kh.narumaru.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.narumaru.admin.model.vo.Admin;
import com.kh.narumaru.notice.model.vo.Notice;
import java.util.Date;
import java.util.HashMap;
import java.util.ArrayList;

import com.kh.narumaru.member.model.vo.Member;
import com.kh.narumaru.narumaru.model.vo.Narumaru;
public interface AdminDao {
 
	ArrayList<Admin> showTotalMemberView(ArrayList<Admin> a);
	ArrayList<Member> memberList();
	Member memberRevenue(); 
	int insertNotice(SqlSessionTemplate sqlSession, Notice n, int subType);
	public HashMap selectEnrollDateList();
	ArrayList<Narumaru> maruView();
	
	
	
	
	
}

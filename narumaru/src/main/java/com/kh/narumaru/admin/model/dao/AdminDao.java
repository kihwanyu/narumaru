package com.kh.narumaru.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.narumaru.admin.model.vo.Admin;
import com.kh.narumaru.notice.model.vo.Notice;
import java.util.Date;
import java.util.HashMap;
import java.util.ArrayList;

import com.kh.narumaru.member.model.vo.Member;
public interface AdminDao {

	ArrayList<Admin> showTotalMemberView(ArrayList<Admin> a);

	int insertNotice(SqlSessionTemplate sqlSession, Notice n);
	public HashMap selectEnrollDateList();

  	Member memberList();

}

package com.kh.narumaru.admin.model.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.ArrayList;
import com.kh.narumaru.admin.model.vo.Admin;
import com.kh.narumaru.notice.model.vo.Notice;
import com.kh.narumaru.member.model.vo.Member;

public interface AdminService {

	ArrayList<Admin> showTotalView(ArrayList<Admin> a);
  public HashMap selectEnrollDateList();//월별 회원수 조회
	void insertNotice(Notice n);
	ArrayList<Member> memberView();
	Member memberRevenue();//결제
  
}

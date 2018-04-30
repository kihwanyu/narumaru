package com.kh.narumaru.admin.model.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.ArrayList;
import com.kh.narumaru.admin.model.vo.Admin;
import com.kh.narumaru.notice.model.vo.Notice;
import com.kh.narumaru.member.model.vo.Member;
import com.kh.narumaru.narumaru.model.vo.Narumaru;

public interface AdminService {

	ArrayList<Admin> showTotalView(ArrayList<Admin> a);
  public HashMap selectEnrollDateList();//월별 회원수 조회
	void insertNotice(Notice n, int subType);
	ArrayList<Member> memberView();//회원목록 조회
	Member memberRevenue();//결제
	ArrayList<Narumaru> maruView();//마루조회
  
}

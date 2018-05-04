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
	int selectTotalMember(); //총 회원수
	int selectTotalMaru();//총 마루수
	int selectDateJoinMember();//금일 가입 회원
	int selectPayDaySysDate();//금일 결제금액
	ArrayList RevenueMember();//결제회원 조회
	ArrayList totalAge();//연령대 별 결제 금액
	ArrayList selectChannel();//채널조회
	ArrayList selectChCount();//채널 수 조회
	ArrayList<Narumaru> naruView();//나루목록조회
	void statusCh(Member m) throws Exception;//회원상태 변경

  
}

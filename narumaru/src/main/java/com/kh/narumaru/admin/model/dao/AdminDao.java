package com.kh.narumaru.admin.model.dao;
//
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
	int selectTotalMember();//총 회원수
	int selectTotalMaru();//총 마루수
	int selectDateJoinMember();//금일 가입회원
	int selectPayDaySysDate();//금일 결제금액
	ArrayList RevenueMember();//결제회원조회
	ArrayList totalAge();//연령대별 결제금액

	ArrayList<Notice> adminAnswer(Notice n);
	ArrayList selectChannel();//채널조회
	ArrayList selectChCount();//채널수 조회
	ArrayList<Narumaru> naruView();//나루 조회
	void statusCh(Member m) throws Exception;//회원상태 수정
	ArrayList moneyView();//환급신청뷰
	void moneyStatusCh(int WNO) throws Exception;//환급신청
	ArrayList Chart();//수익분석차트
	void moneyStop(int wNO) throws Exception;//환급거부
	ArrayList<Integer> sendUser(int WNO);//환급알림
	ArrayList<Integer> getMemberMnoAll(SqlSessionTemplate sqlSession);
	int selectBnoCurrentVal(SqlSessionTemplate sqlSession);

	
	
	
	
}

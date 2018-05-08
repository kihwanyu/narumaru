package com.kh.narumaru.admin.model.service;


import java.util.Date;
import java.util.HashMap;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.narumaru.admin.model.dao.AdminDao;
import com.kh.narumaru.admin.model.vo.Admin;
import com.kh.narumaru.notice.model.vo.Notice;
import com.kh.narumaru.member.model.vo.Member;
import com.kh.narumaru.narumaru.model.vo.Narumaru;
@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao ad;
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Admin> showTotalView(ArrayList<Admin> a) {
		System.out.println("adminServiceImpl");
		
		ArrayList<Admin> result1 = ad.showTotalMemberView(a);
		
		System.out.println(result1);
				
		return result1;
	}

	@Override
	public HashMap selectEnrollDateList() {
		HashMap list = ad.selectEnrollDateList();
		
		return list;
	}

	public ArrayList<Member> memberView() {
		System.out.println("service야 나오니?");
		ArrayList<Member> member = ad.memberList();
		
		return member;
	}
	
	@Override
	public Member memberRevenue(){
		System.out.println("결제 나오니?");
		Member member = ad.memberRevenue();
		return member; 
	}


	public void insertNotice(Notice n, int subType) {
		 ad.insertNotice(sqlSession, n, subType);
  }

	@Override
	public ArrayList<Narumaru> maruView() {
		System.out.println("adMaru서비스야 나오니?");
		ArrayList<Narumaru> ma = ad.maruView();
		
		return ma;
	}

	@Override
	public int selectTotalMember() {
		System.out.println("총 회원수 구해지니?");
		int totalMember = ad.selectTotalMember();
		
		return totalMember;
	}

	@Override
	public int selectTotalMaru() {
		System.out.println("총 마루수 구해지니?");
		int totalMaru = ad.selectTotalMaru();
		
		return totalMaru;
	}

	@Override
	public int selectDateJoinMember() {
		int selectDateJoinMember = ad.selectDateJoinMember();
		
		return selectDateJoinMember;
	}

	@Override
	public int selectPayDaySysDate() {
		int selectPayDaySysDate = ad.selectPayDaySysDate();
		
		return selectPayDaySysDate;
	}

	@Override
	public ArrayList RevenueMember() {
		ArrayList RevenueMember = ad.RevenueMember();
		
		return RevenueMember;
	}

	@Override
	public ArrayList totalAge() {
		ArrayList totalAge = ad.totalAge();
		
		return totalAge;
	}
	//
	@Override

	public ArrayList<Notice> adminAnswer(Notice n) {
		
		return ad.adminAnswer(n);
	}
	public ArrayList selectChannel() {
		ArrayList selectChannel = ad.selectChannel();
		System.out.println("채널 : " + selectChannel);
		return selectChannel;
	}

	@Override
	public ArrayList selectChCount() {
		ArrayList chCount = ad.selectChCount();
		return chCount;
	}

	@Override
	public ArrayList<Narumaru> naruView() {
		ArrayList<Narumaru> naruView = ad.naruView();
		return naruView;
	}

	@Override
	public void statusCh(Member m) throws Exception {
		ad.statusCh(m);
	}

	@Override
	public ArrayList moneyView() {
		ArrayList moneyView = ad.moneyView();
		return moneyView;
	}

	@Override
	public void moneyStatusCh(int WNO) throws Exception {
		ad.moneyStatusCh(WNO);
		
	}

	@Override
	public ArrayList Chart() {
		ArrayList Chart = ad.Chart();
		return Chart;
	}
}

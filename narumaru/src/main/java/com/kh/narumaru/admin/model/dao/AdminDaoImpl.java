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
import com.kh.narumaru.narumaru.model.vo.Narumaru;
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
	@Override
	public int insertNotice(SqlSessionTemplate sqlSession, Notice n, int subType) {
		int result = sqlSession.insert("Board.insertNotice", n);
		
		return result;
	}


	@Override
	public ArrayList<Narumaru> maruView() {
		System.out.println("adDAO 나오는거지?");
		ArrayList<Narumaru> ma = (ArrayList)sqlSession.selectList("Admin.maruView");
		System.out.println("DAO ma : " + ma);
		
		return ma;
	}


	@Override
	public int selectTotalMember() {
		System.out.println("totalMember 나오는거지?");
		int totalMember = sqlSession.selectOne("Admin.totalMember");
		
		return totalMember;
	}


	@Override
	public int selectTotalMaru() {
		System.out.println("totalMaru 나오니?");
		int totalMaru = sqlSession.selectOne("Admin.totalMaru");
		
		return totalMaru;
	}


	@Override
	public int selectDateJoinMember() {
		int selectDateJoinMember = sqlSession.selectOne("Admin.selectDateJoinMember");
		
		return selectDateJoinMember;
	}


	@Override
	public int selectPayDaySysDate() {
		int selectPayDaySysDate = sqlSession.selectOne("Admin.selectPayDaySysDate");
		
		return selectPayDaySysDate;
	}


	@Override
	public ArrayList RevenueMember() {
		ArrayList RevenueMember = (ArrayList) sqlSession.selectList("Admin.RevenueMember");
		return RevenueMember;
	}


	@Override
	public ArrayList totalAge() {
		ArrayList totalAge = (ArrayList) sqlSession.selectList("Admin.totalAge");
		return totalAge;
	}


	@Override
	public ArrayList<Notice> adminAnswer(Notice n) {
		n.setNoType(900);
		System.out.println("adminDao questionSelectLst n :" +n );
		ArrayList<Notice> nlist = null;
		nlist = (ArrayList)sqlSession.selectList("Admin.questionSelectList", n);
		//
		System.out.println("adminDao adminSelectList nlist"  + nlist);

		return nlist;
  }
	public ArrayList selectChannel() {
		ArrayList selectChannel = (ArrayList) sqlSession.selectList("Admin.selectChannel");
		System.out.println("DAO채널 : " + selectChannel);
		return selectChannel;
	}


	@Override
	public ArrayList selectChCount() {
		ArrayList chCount = (ArrayList) sqlSession.selectList("Admin.selectchCount");
		return chCount;
	}


	@Override
	public ArrayList<Narumaru> naruView() {
		ArrayList<Narumaru> naruView = (ArrayList) sqlSession.selectList("Admin.selectNaruView");
		return naruView;
	}


	@Override
	public void statusCh(Member m) throws Exception {
		int result = sqlSession.update("Admin.changeStatus", m);
		if(result < 0){
			throw new Exception("회원상태수정실패");
		}
		System.out.println("dao : " + result);
	}


	@Override
	public ArrayList moneyView() {
		ArrayList moneyView = (ArrayList) sqlSession.selectList("Admin.selectMoneyView");
		return moneyView;
	}


	@Override
	public void moneyStatusCh(int WNO) throws Exception {
		int result = sqlSession.update("Admin.moneyStatusCh", WNO);
		if(result < 0){
			throw new Exception("실패");
		}
		System.out.println("dao : " + result);
		
	}


	@Override
	public ArrayList Chart() {
		ArrayList Chart = (ArrayList) sqlSession.selectList("Admin.Chart");
		return Chart;
	}


	@Override
	public void moneyStop(int WNO) throws Exception {
		int result = sqlSession.update("Admin.moneyStop", WNO);
		
		if(result < 0){
			throw new Exception("실패");
		}
		System.out.println("dao : " + result);
	}


	@Override
	public ArrayList<Integer> sendUser(int WNO) {
		ArrayList<Integer> sendUser = (ArrayList)sqlSession.selectList("Admin.sendUser",WNO);
		System.out.println("sendUser : " + sendUser);
		return sendUser;
	}


	@Override
	public ArrayList<Integer> getMemberMnoAll(SqlSessionTemplate sqlSession) {
		
		ArrayList<Integer> list = (ArrayList)sqlSession.selectList("Admin.getMemberMnoAll");
		
		return list;
	}


	@Override
	public int selectBnoCurrentVal(SqlSessionTemplate sqlSession) {
		
		int result = sqlSession.selectOne("Admin.selectBnoCurrentVal");
		
		return result;
	}


}

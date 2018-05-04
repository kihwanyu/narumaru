package com.kh.narumaru.payment.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.narumaru.member.model.vo.Member;
import com.kh.narumaru.narumaru.model.vo.Board;
import com.kh.narumaru.payment.model.vo.UsePoint;

@Repository
public class UsePointDaoImpl implements UsePointDao {

	@Override
	public int insertUsePoint(Board b, Member loginUser, int deposit, SqlSessionTemplate sqlSession) {
		int result = 0;
		
		UsePoint u = new UsePoint();
		
		u.setpContent(b.getBno() + "번 글 구매");
		u.setAmount(b.getNeedPoint());
		u.setMno(loginUser.getMid());
		u.setBno(b.getBno());
		
		System.out.println("insertUsePointDao - b : " + b);
		System.out.println("insertUsePointDao - deposit : " + deposit);

		if(deposit >= b.getNeedPoint()){
			result = sqlSession.insert("Payment.insertUsePoint", u);
			/*sqlSession.insert("Hidden.insertHiddenPayment", h);*/
		}else{
			//-1 잔고부족
			result = -1;
		}
		
		return result;
	}

	@Override
	public ArrayList<UsePoint> selectUsePoint(int mno, SqlSessionTemplate sqlSession) {
		ArrayList<UsePoint> list = (ArrayList)sqlSession.selectList("Payment.selectUsePoint", mno);
		return list;
	}

}

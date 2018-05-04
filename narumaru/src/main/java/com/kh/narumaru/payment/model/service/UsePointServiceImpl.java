package com.kh.narumaru.payment.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.narumaru.member.model.vo.Member;
import com.kh.narumaru.narumaru.model.vo.Board;
import com.kh.narumaru.payment.model.dao.UsePointDao;
import com.kh.narumaru.payment.model.vo.UsePoint;

@Service
public class UsePointServiceImpl implements UsePointService{
	@Autowired
	private UsePointDao upd;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertUsePoint(Board b, Member loginUser, int deposit) {
		return upd.insertUsePoint(b, loginUser, deposit, sqlSession);
	}

	@Override
	public ArrayList<UsePoint> selectUsePoint(int mid) {
		return upd.selectUsePoint(mid, sqlSession);
	}

}

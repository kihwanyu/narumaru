package com.kh.narumaru.payment.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.narumaru.common.model.vo.PageInfo;
import com.kh.narumaru.member.model.vo.Member;
import com.kh.narumaru.narumaru.model.vo.Board;
import com.kh.narumaru.payment.model.vo.Stats;
import com.kh.narumaru.payment.model.vo.UsePoint;

public interface UsePointDao {

	int insertUsePoint(Board b, Member loginUser, int deposit, SqlSessionTemplate sqlSession);

	ArrayList<UsePoint> selectUsePoint(int mid, SqlSessionTemplate sqlSession);

	int getUsingHistoryListCount(SqlSessionTemplate sqlSession, int mno);

	ArrayList<UsePoint> selectUseHistoryList(SqlSessionTemplate sqlSession, PageInfo pi);

	int getUserPointTotal(SqlSessionTemplate sqlSession, int mno);

	int getRevenueListCount(SqlSessionTemplate sqlSession, int mno);

	ArrayList<UsePoint> selectRevenueList(SqlSessionTemplate sqlSession, PageInfo pi);

	ArrayList<String> getBeingYearList(SqlSessionTemplate sqlSession, int mno);

	ArrayList<Stats> selectYearMonthRevenueStats(SqlSessionTemplate sqlSession, Stats s);

	int getRevenueTotalPoint(SqlSessionTemplate sqlSession, int mno);

}

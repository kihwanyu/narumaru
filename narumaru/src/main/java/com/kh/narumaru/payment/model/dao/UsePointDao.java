package com.kh.narumaru.payment.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.narumaru.member.model.vo.Member;
import com.kh.narumaru.narumaru.model.vo.Board;
import com.kh.narumaru.payment.model.vo.UsePoint;

public interface UsePointDao {

	int insertUsePoint(Board b, Member loginUser, int deposit, SqlSessionTemplate sqlSession);

	ArrayList<UsePoint> selectUsePoint(int mid, SqlSessionTemplate sqlSession);

}

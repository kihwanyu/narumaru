package com.kh.narumaru.payment.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.narumaru.member.model.vo.Member;
import com.kh.narumaru.narumaru.model.vo.Board;

public interface UsePointDao {

	int insertUsePoint(Board b, Member loginUser, int deposit, SqlSessionTemplate sqlSession);

}

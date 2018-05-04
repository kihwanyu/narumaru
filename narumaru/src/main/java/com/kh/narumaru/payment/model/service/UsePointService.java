package com.kh.narumaru.payment.model.service;

import java.util.ArrayList;

import com.kh.narumaru.member.model.vo.Member;
import com.kh.narumaru.narumaru.model.vo.Board;
import com.kh.narumaru.payment.model.vo.UsePoint;

public interface UsePointService {

	int insertUsePoint(Board b, Member loginUser, int deposit);

	ArrayList<UsePoint> selectUsePoint(int mid);

}

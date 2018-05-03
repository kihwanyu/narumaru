package com.kh.narumaru.payment.model.service;

import com.kh.narumaru.member.model.vo.Member;
import com.kh.narumaru.narumaru.model.vo.Board;

public interface UsePointService {

	int insertUsePoint(Board b, Member loginUser, int deposit);

}

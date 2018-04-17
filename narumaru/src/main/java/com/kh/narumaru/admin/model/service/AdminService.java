package com.kh.narumaru.admin.model.service;

import java.util.Date;
import java.util.ArrayList;

import com.kh.narumaru.member.model.vo.Member;

public interface AdminService {
	ArrayList<Date> selectEnrollDateList();//월별 회원수 조회
}

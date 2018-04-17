package com.kh.narumaru.admin.model.dao;

import java.util.Date;
import java.util.ArrayList;

import com.kh.narumaru.member.model.vo.Member;

public interface AdminDao {

	ArrayList<Date> selectEnrollDateList();

}

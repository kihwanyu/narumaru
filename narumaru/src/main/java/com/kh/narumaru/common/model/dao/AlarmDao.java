package com.kh.narumaru.common.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.narumaru.common.model.exception.alarmRequestException;
import com.kh.narumaru.common.model.exception.alarmResponseException;
import com.kh.narumaru.common.model.vo.Alarm;

public interface AlarmDao {

	void alarmRequest(SqlSessionTemplate sqlSession, Alarm alarm) throws alarmRequestException;

	ArrayList<Alarm> alarmResponse(SqlSessionTemplate sqlSession, int mno) throws alarmResponseException;

}

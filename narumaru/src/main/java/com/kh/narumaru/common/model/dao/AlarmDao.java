package com.kh.narumaru.common.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.narumaru.common.model.exception.alarmRequestException;
import com.kh.narumaru.common.model.vo.Alarm;

public interface AlarmDao {

	void alarmRequest(SqlSessionTemplate sqlSession, Alarm alarm) throws alarmRequestException;

}

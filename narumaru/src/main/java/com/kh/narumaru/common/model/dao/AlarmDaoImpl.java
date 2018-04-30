package com.kh.narumaru.common.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.narumaru.common.model.exception.alarmRequestException;
import com.kh.narumaru.common.model.vo.Alarm;

@Repository
public class AlarmDaoImpl implements AlarmDao {

	@Override
	public void alarmRequest(SqlSessionTemplate sqlSession, Alarm alarm) throws alarmRequestException {
		int result = sqlSession.insert("Alarm.alarmRequest", alarm);
		
		if(result <= 0){
			throw new alarmRequestException("알람 요청 에러 - INSERT");
		}
	}

}

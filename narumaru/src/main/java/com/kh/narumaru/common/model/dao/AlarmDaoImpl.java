package com.kh.narumaru.common.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.narumaru.common.model.exception.alarmRequestException;
import com.kh.narumaru.common.model.exception.alarmResponseException;
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

	@Override
	public ArrayList<Alarm> alarmResponse(SqlSessionTemplate sqlSession, int mno) throws alarmResponseException {
		ArrayList<Alarm> aList = (ArrayList)sqlSession.selectList("Alarm.alarmResponse", mno);
		
		if(aList == null){
			throw new alarmResponseException("알림 응답 에러 - SELECT");
		}
		
		return aList;
	}

	@Override
	public int alarmStatusCount(SqlSessionTemplate sqlSession, int mno) {
		
		int count = sqlSession.selectOne("Alarm.alarmStatusCount",mno);
		
		return count;
	}

	@Override
	public void alarmStatusUpdate(SqlSessionTemplate sqlSession, int ano) {
		int result = sqlSession.update("Alarm.alarmStatusUpdate", ano);
	}

}

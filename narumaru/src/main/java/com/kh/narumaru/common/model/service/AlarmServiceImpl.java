package com.kh.narumaru.common.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.narumaru.common.model.dao.AlarmDao;
import com.kh.narumaru.common.model.exception.alarmRequestException;
import com.kh.narumaru.common.model.vo.Alarm;

@Service
public class AlarmServiceImpl implements AlarmService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AlarmDao ad;

	@Override
	public void alarmRequest(Alarm alarm) throws alarmRequestException {
		
		ad.alarmRequest(sqlSession ,alarm);
	}
	
}

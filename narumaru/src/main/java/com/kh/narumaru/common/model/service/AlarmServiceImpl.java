package com.kh.narumaru.common.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.narumaru.common.model.dao.AlarmDao;
import com.kh.narumaru.common.model.exception.alarmRequestException;
import com.kh.narumaru.common.model.exception.alarmResponseException;
import com.kh.narumaru.common.model.vo.Alarm;

@Service
public class AlarmServiceImpl implements AlarmService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AlarmDao ad;

	@Override
	public ArrayList<Alarm> alarmResponse(int mno) throws alarmResponseException {
		
		ArrayList<Alarm> aList = ad.alarmResponse(sqlSession, mno);
		
		return aList;
	}

	@Override
	public void alarmRequest(ArrayList<Alarm> alarmList) throws alarmRequestException {
		/*보내는 수만큼 for문을 돌려준다.*/
		for(int i = 0; i < alarmList.size(); i++){
			ad.alarmRequest(sqlSession ,alarmList.get(i));
		}
	}

	@Override
	public int alarmStatusCount(int mno) {
		
		int count = ad.alarmStatusCount(sqlSession, mno);
		
		return count;
	}

	@Override
	public void alarmStatusUpdate(int ano) {
		
		ad.alarmStatusUpdate(sqlSession, ano);
		
	}

}

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
	public void alarmRequest(ArrayList<Alarm> alarm, ArrayList<Integer> sendUser) throws alarmRequestException {
		/*보내는 수만큼 for문을 돌려준다.*/
		for(int i = 0; i < sendUser.size(); i++){
			ad.alarmRequest(sqlSession ,alarm.get(i));
		}
	}
	
}

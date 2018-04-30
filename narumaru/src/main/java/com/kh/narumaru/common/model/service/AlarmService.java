package com.kh.narumaru.common.model.service;

import java.util.ArrayList;

import com.kh.narumaru.common.model.exception.alarmRequestException;
import com.kh.narumaru.common.model.exception.alarmResponseException;
import com.kh.narumaru.common.model.vo.Alarm;

public interface AlarmService {

	void alarmRequest(Alarm alarm) throws alarmRequestException;

	ArrayList<Alarm> alarmResponse(int mno) throws alarmResponseException;

}

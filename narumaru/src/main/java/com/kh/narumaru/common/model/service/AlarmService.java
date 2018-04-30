package com.kh.narumaru.common.model.service;

import com.kh.narumaru.common.model.exception.alarmRequestException;
import com.kh.narumaru.common.model.vo.Alarm;

public interface AlarmService {

	void alarmRequest(Alarm alarm) throws alarmRequestException;

}

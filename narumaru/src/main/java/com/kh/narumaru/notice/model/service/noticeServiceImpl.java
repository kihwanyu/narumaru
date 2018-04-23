package com.kh.narumaru.notice.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.narumaru.notice.model.dao.noticeDao;
import com.kh.narumaru.notice.model.vo.Notice;

@Service
public class noticeServiceImpl implements noticeService {
	@Autowired
	private noticeDao nd;

	@Override
	public ArrayList<Notice> noticeSelectList(Notice n) {
		System.out.println("noticeService noticeSelectList ");
		
		return nd.noticeSelectList(n);
	}
	
	
}

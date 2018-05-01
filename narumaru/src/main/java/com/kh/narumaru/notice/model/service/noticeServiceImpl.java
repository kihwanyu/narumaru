package com.kh.narumaru.notice.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.narumaru.notice.exception.NoticeUpdateException;
import com.kh.narumaru.notice.model.dao.noticeDao;
import com.kh.narumaru.notice.model.vo.Notice;

@Service
public class noticeServiceImpl implements noticeService {
	@Autowired
	private noticeDao nd;
	
	//공지사항 전체 list 보기
	@Override
	public ArrayList<Notice> noticeSelectList(Notice n) {
		System.out.println("noticeService noticeSelectList ");
		
		return nd.noticeSelectList(n);
	}


	//공지사항 자세히보기
	@Override
	public Notice showNoticeDetailView(int bno) {
		System.out.println("noticeService noticeSelectList ");
		
		return nd.showNoticeDetailView(bno);
	}

	//공지사항 수정하기
	@Override
	public void updateNoticeCommit(Notice n) throws NoticeUpdateException {
		System.out.println("noticeService updateNoticeCommit ");
		
		nd.updateNoticeCommit(n);
		
	}	
		
	//FAQ 전체 조회하기
	@Override
	public ArrayList<Notice> faqSelectList(Notice n) {
		System.out.println("noticeService faqSelectList ");
		
		return nd.faqSelectList(n);
	}




	


	
	
}

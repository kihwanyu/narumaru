package com.kh.narumaru.notice.model.service;

import java.util.ArrayList;

import com.kh.narumaru.notice.Exception.NoticeUpdateException;
import com.kh.narumaru.notice.model.vo.Notice;

public interface noticeService {

	ArrayList<Notice> noticeSelectList(Notice n);

	Notice showNoticeDetailView(int bno);

	ArrayList<Notice> faqSelectList(Notice n);

	

	void updateNoticeCommit(Notice n) throws NoticeUpdateException;

}

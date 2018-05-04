package com.kh.narumaru.notice.model.service;

import java.util.ArrayList;

import com.kh.narumaru.notice.exception.NoticeDeleteException;
import com.kh.narumaru.notice.exception.NoticeUpdateException;
import com.kh.narumaru.notice.model.vo.Notice;

public interface noticeService {

	ArrayList<Notice> noticeSelectList(Notice n);

	Notice showNoticeDetailView(int bno);

	ArrayList<Notice> faqSelectList(Notice n);

	

	void updateNoticeCommit(Notice n) throws NoticeUpdateException;

	Notice showFaqDetailView(int bno);

	void deleteNotice(int bno) throws NoticeDeleteException;

	void questionInsert(Notice n); 

}

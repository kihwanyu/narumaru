package com.kh.narumaru.notice.model.dao;

import java.util.ArrayList;

import com.kh.narumaru.notice.exception.NoticeUpdateException;
import com.kh.narumaru.notice.model.vo.Notice;

public interface noticeDao {

	ArrayList<Notice> noticeSelectList(Notice n);

	Notice showNoticeDetailView(int bno);

	ArrayList<Notice> faqSelectList(Notice n);


	void updateNoticeCommit(Notice n) throws NoticeUpdateException; 

}

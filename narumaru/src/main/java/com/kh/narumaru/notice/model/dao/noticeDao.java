package com.kh.narumaru.notice.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.narumaru.common.model.vo.PageInfo;
import com.kh.narumaru.notice.exception.NoticeDeleteException;
import com.kh.narumaru.notice.exception.NoticeUpdateException;
import com.kh.narumaru.notice.exception.questionInsertException;
import com.kh.narumaru.notice.exception.searchFaqException;
import com.kh.narumaru.notice.model.vo.Notice;

public interface noticeDao {
//
	Notice showNoticeDetailView(int bno);

	ArrayList<Notice> faqSelectList(Notice n);


	void updateNoticeCommit(Notice n) throws NoticeUpdateException;

	Notice showFaqDetailView(int bno);

	void deleteNotice(int bno) throws NoticeDeleteException;

	void questionInsert(Notice n) throws questionInsertException;

	int getListCount(SqlSessionTemplate sqlSession, int currentPage);

	ArrayList<Notice> SearchFAQList(String keyWord) throws searchFaqException;

	ArrayList<Notice> noticeSelectList(SqlSessionTemplate sqlSession, Notice n, PageInfo pi); 

}

package com.kh.narumaru.notice.model.dao;

import java.util.ArrayList;

import com.kh.narumaru.notice.model.vo.Notice;

public interface noticeDao {

	ArrayList<Notice> noticeSelectList(Notice n);

}
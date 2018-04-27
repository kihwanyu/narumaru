package com.kh.narumaru.notice.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.narumaru.notice.model.vo.Notice;


@Repository
public class noticeDaoImpl implements noticeDao{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public ArrayList<Notice> noticeSelectList(Notice n) {
		System.out.println("noticeDao noticeSelectLst");
		ArrayList<Notice> nlist = null;
		
		nlist = (ArrayList)sqlSession.selectList("Board.noticeSelectList");
		
		System.out.println("noticeDao noticeSelectList nlist"  + nlist);

		return nlist;
		
	}



	@Override
	public Notice showNoticeDetailView(int bno) {
		Notice n = null;
		System.out.println("noticeDaoImpl showNoticeDetailView");
		
		n = (Notice) sqlSession.selectOne("Board.noticeSelectListOne", bno);
		System.out.println("noticeDaoImpl showNoticeDetailView n " + n);
		
		return n;
	}

}

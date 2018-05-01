package com.kh.narumaru.notice.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.narumaru.notice.exception.NoticeUpdateException;
import com.kh.narumaru.notice.model.vo.Notice;


@Repository
public class noticeDaoImpl implements noticeDao{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//공지사항 전체 list 
	@Override
	public ArrayList<Notice> noticeSelectList(Notice n) {
		n.setNoType(700);
		System.out.println("noticeDao noticeSelectLst n :" +n );
		ArrayList<Notice> nlist = null;
		nlist = (ArrayList)sqlSession.selectList("Board.noticeSelectList", n);
		
		System.out.println("noticeDao noticeSelectList nlist"  + nlist);

		return nlist;
		
	}


	//공지사항 자세히보기
	@Override
	public Notice showNoticeDetailView(int bno) {
		Notice n = null;
		System.out.println("noticeDaoImpl showNoticeDetailView");
		
		n = (Notice) sqlSession.selectOne("Board.noticeSelectListOne", bno);
		System.out.println("noticeDaoImpl showNoticeDetailView n " + n);
		
		return n;
	}


	//공지사항 update
	@Override
	public void updateNoticeCommit(Notice n) throws NoticeUpdateException {
		
		System.out.println("noticeDaoImpl updateNoticeCommit");
		
		int result = sqlSession.update("Board.updateNoticeCommit", n);
		
		if(result < 0){
			throw new NoticeUpdateException("수정 실패~"); 
			
		} 
	}
	
	
	
	//FAQ 전체 list 조회
	@Override
	public ArrayList<Notice> faqSelectList(Notice n) {
		n.setNoType(80);
		System.out.println("noticeDao faqSelectList n : " + n);
		ArrayList<Notice> nlist = null;
		
		nlist = (ArrayList)sqlSession.selectList("Board.noticeSelectList");
		
		System.out.println("noticeDao faqSelectList nlist"  + nlist);

		return nlist;
		
	}


	




}

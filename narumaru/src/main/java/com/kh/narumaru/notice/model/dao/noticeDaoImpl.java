package com.kh.narumaru.notice.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.narumaru.maru.exception.MaruException;
import com.kh.narumaru.notice.exception.NoticeDeleteException;
import com.kh.narumaru.notice.exception.NoticeUpdateException;
import com.kh.narumaru.notice.exception.questionInsertException;
import com.kh.narumaru.notice.exception.searchFaqException;
import com.kh.narumaru.notice.model.vo.Notice;
import com.kh.narumaru.payment.model.vo.Payment;


@Repository
public class noticeDaoImpl implements noticeDao{
	@Autowired
	private SqlSessionTemplate sqlSession;
	//
	

	@Override
	public int getListCount(SqlSessionTemplate sqlSession, int currentPage) {
		int result = 0;
		// 결제 내역이 없을 경우. CHAEK 하기위해서 이용.
		/*Payment paymentResult = sqlSession.selectOne("Payment.selectPayment",mno);
		if(paymentResult != null){
			result = sqlSession.selectOne("Payment.selectPaymentListCount",mno);
		} */
		System.out.println("noticeDao getListCount sqlSession, currentPage : " + sqlSession +" / "+currentPage);
		
		Notice nResult = sqlSession.selectOne("Board.selectNotice"/*, currentPage*/);
		
		System.out.println("noticeDao nResult : " + nResult);
		
		if(nResult != null){
			result = sqlSession.selectOne("Board.selectNoticeListCount"/*, currentPage*/);
			System.out.println("noticeDao result : " + result);
		}
		
		return result;
	}

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


	//공지사항 FAQ 수정하기
	@Override
	public void updateNoticeCommit(Notice n) throws NoticeUpdateException {
		
		System.out.println("noticeDaoImpl updateNoticeCommit");
		
		int result = sqlSession.update("Board.updateNoticeCommit", n);
		
		if(result < 0){
			throw new NoticeUpdateException("수정 실패~"); 
			
		} 
	}
	
	//공지사항 FAQ 삭제
	@Override
	public void deleteNotice(int bno) throws NoticeDeleteException {
		System.out.println("noticeDaoImpl deleteNotice bno : " + bno);
		
		int result = sqlSession.delete("Board.deleteNotice", bno);
		
		if(result < 0){
			throw new NoticeDeleteException("삭제 실패~");
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
		//FAQ 키워드 검색
		@Override
		public ArrayList<Notice> SearchFAQList(String keyWord) throws searchFaqException {
			System.out.println("noticeDao SearchFAQList keyWord : " +keyWord);
			
			ArrayList nlist = (ArrayList) sqlSession.selectList("Board.SearchFAQList", keyWord);
			System.out.println("noticeDao nlist : "  +nlist);
			if(nlist == null){
				throw new searchFaqException("키워드 검색 실패");
			}
			
			return nlist;
		}

		//faq detail 조회
		@Override
		public Notice showFaqDetailView(int bno) {
			Notice n = null;
			System.out.println("noticeDaoImpl showNoticeDetailView");
			
			n = (Notice) sqlSession.selectOne("Board.noticeSelectListOne", bno);
			System.out.println("noticeDaoImpl showNoticeDetailView n " + n);
			
			return n;
		}




		@Override
		public void questionInsert(Notice n) throws questionInsertException {
			System.out.println("noticeDaoImpl questionInsert n : " + n );
			
			int result = sqlSession.insert("Board.questionInsert",n);
			
			System.out.println("1번 insert");
			
			if(result >= 0 ){
				sqlSession.insert("Board.questionFileInsert", n);
			}
			else{
				throw new questionInsertException("1:1 문의 등록 실패 ");
			}
			
			
		}

		






	




}

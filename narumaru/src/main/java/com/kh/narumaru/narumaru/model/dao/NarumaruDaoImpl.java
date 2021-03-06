package com.kh.narumaru.narumaru.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.narumaru.member.model.vo.Member;
import com.kh.narumaru.common.model.vo.Neighbor;
import com.kh.narumaru.naru.model.vo.Theme;
import com.kh.narumaru.narumaru.exception.NarumaruException;
import com.kh.narumaru.narumaru.model.vo.Board;
import com.kh.narumaru.narumaru.model.vo.Narumaru;

@Repository
public class NarumaruDaoImpl implements NarumaruDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Board> selectBoardList(int nmno) {
		
		ArrayList<Board> list = (ArrayList)sqlSession.selectList("Board.selectBoardList", nmno);
		
		return list;
	}
	
	@Override
	public ArrayList<Board> selectCategoryBoardList(int nmno, int categoryNo) {
		
		Board b = new Board();
		b.setNmno(nmno);
		b.setCano(categoryNo);
		
		ArrayList<Board> list = (ArrayList)sqlSession.selectList("Board.selectCategoryBoardList", b);
		
		return list;
	}

	@Override
	public Narumaru insertNarumaru(SqlSessionTemplate sqlSession, Narumaru nm) throws NarumaruException {
		
		int result = sqlSession.insert("Narumaru.insertNarumaru", nm);
		
		if(result<0){
			throw new NarumaruException("나루마루 생성 실패");
		}else{
			int result2 = sqlSession.insert("Narumaru.insertTheme", nm.getNmno());
		}
		return nm;
	}
	
	@Override
	public Narumaru selectNarumaruOne(int nmno) {
		
		Narumaru nm = (Narumaru)sqlSession.selectOne("Narumaru.selectNarumaruOne", nmno);
		
		System.out.println(nm);
		
		return nm;
	}

	@Override
	public int checkNarumaruOwner(int nmno, Member loginUser) {
		
		int ownerMno = sqlSession.selectOne("Narumaru.checkNarumaruOwner", nmno);
		
		return ownerMno;
	}
	
	@Override
	public int checkNeighbor(int nmno, Member loginUser) {
		Neighbor n = new Neighbor();
		
		int ownerMno = sqlSession.selectOne("Narumaru.checkNarumaruOwner", nmno);
		
		n.setMno(ownerMno);
		n.setUser_mno(loginUser.getMid());
		
		int resultNeighbor = sqlSession.selectOne("Neighbor.selectNeighbor", n);
		
		//1개 이상 리턴되면 이웃을 걸어놨다는 뜻
		return resultNeighbor;
	}

	@Override
	public Board insertNarumaruBoard(SqlSessionTemplate sqlSession, Board b) throws NarumaruException {
		System.out.println(b);
		int result = sqlSession.insert("Narumaru.insertNarumaruBoard", b);
		
		if(result<0){
			throw new NarumaruException("나루마루보드 생성실패");
		}else{
			
		}
		return b;
	}

	@Override
	public Board selectBoardOne(int bno) {
		Board b = (Board)sqlSession.selectOne("Board.selectBoardOne", bno);
		
		System.out.println("narumaruDao : "+b);
		
		return b;
	}

	@Override
	public Board updateBoardOne(SqlSessionTemplate sqlSession, Board b) throws NarumaruException {
		
		System.out.println("updateBoardOne : " + b);
		
		int result = sqlSession.update("Board.updateBoardOne", b);
		if(result<0){
			throw new NarumaruException("게시글 갱신 실패");
		}else{
			
		}
		return b;
	}

	@Override
	public void deleteBoardOne(SqlSessionTemplate sqlSession, int bno) throws NarumaruException {
		
		int result = sqlSession.update("Board.deleteBoardOne", bno);
		
		if(result<0){
			throw new NarumaruException("게시글 삭제 실패");
		}else{
			
		}
	}

	@Override
	public ArrayList<Board> selectCommentList(int nmno) {
		ArrayList<Board> colist = (ArrayList)sqlSession.selectList("Board.selectCommentList", nmno);
		
		System.out.println(colist);
		
		return colist;
	}

	@Override
	public void insertComment(SqlSessionTemplate sqlSession, Board b) throws NarumaruException {
		int result = sqlSession.insert("Narumaru.insertComment", b);
		if(result<0){
			throw new NarumaruException("댓글 작성 실패");
		}else{
			
		}
	}

	@Override
	public int selectNarumaruType(int nmno) {
		Narumaru nm = (Narumaru)sqlSession.selectOne("Narumaru.selectNarumaruOne", nmno);
		
		System.out.println(nm);
		
		return nm.getNmCategory();
	}

	@Override
	public ArrayList<Board> selectWritedBoardList(int mid) {
		
		ArrayList<Board> list = (ArrayList)sqlSession.selectList("Board.selectWritedBoardList", mid);
		
		return list;
	}

	@Override
	public ArrayList<Board> selectWritedCommentList(int mid) {
		
		ArrayList<Board> list = (ArrayList)sqlSession.selectList("Board.selectWritedCommentList", mid);
		
		return list;
	}

	@Override
	public ArrayList<Board> selectCommentListAll() {
		ArrayList<Board> list = (ArrayList)sqlSession.selectList("Board.selectCommentListAll");
		
		return list;
	}

	@Override
	public Theme selectThemeOne(int nmno) {
		Theme theme = (Theme)sqlSession.selectOne("Naru.selectThemeOne",nmno);
		return theme;
	}

	@Override
	public int getBoardWriter(Board b) {
		int oriWriterMno = sqlSession.selectOne("Board.getBoardWriter",b);
    
		return oriWriterMno;
  }

  @Override
	public void updateDefault(Narumaru nm, SqlSessionTemplate sqlSession) {
		int result = sqlSession.update("Narumaru.updateDefault",nm);
	}

	@Override
	public ArrayList<Board> searchBoard(Board b) {
		ArrayList<Board> list = (ArrayList)sqlSession.selectList("Board.searchBoard", b);
		return list;
	}
	
	@Override
	public ArrayList<Board> selectChannelBoardList(int cno, SqlSessionTemplate sqlSession) {
		ArrayList<Board> list = (ArrayList)sqlSession.selectList("Board.selectChannelBoardList", cno);
		
		return list;
	}

	@Override
	public ArrayList<Board> searchNarumaruBoard(String searchCondition, SqlSessionTemplate sqlSession) {
		System.out.println("searchCondition : " + searchCondition);
		ArrayList<Board> list = (ArrayList)sqlSession.selectList("Board.searchNarumaruBoard", searchCondition);
		
		return list;
	}

	@Override
	public ArrayList<Narumaru> searchNarumaru(String searchCondition, SqlSessionTemplate sqlSession) {
		ArrayList<Narumaru> list = (ArrayList)sqlSession.selectList("Narumaru.searchNarumaru", searchCondition);
		
		return list;
	}

	@Override
	public ArrayList<Narumaru> selectBestNaru(SqlSessionTemplate sqlSession) {
		ArrayList<Narumaru> list = (ArrayList)sqlSession.selectList("Narumaru.selectBestNaru");
		return list;
	}

	@Override
	public ArrayList<Narumaru> selectBestMaru(SqlSessionTemplate sqlSession) {
		ArrayList<Narumaru> list = (ArrayList)sqlSession.selectList("Narumaru.selectBestMaru");
		return list;
	}

}

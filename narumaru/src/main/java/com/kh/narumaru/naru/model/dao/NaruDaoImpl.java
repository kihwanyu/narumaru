package com.kh.narumaru.naru.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.narumaru.naru.model.exception.NaruException;
import com.kh.narumaru.naru.model.vo.Category;
import com.kh.narumaru.common.model.vo.Neighbor;
import com.kh.narumaru.naru.model.vo.Theme;
import com.kh.narumaru.narumaru.model.vo.Narumaru;

@Repository
public class NaruDaoImpl implements NaruDao{

	@Override
	public void insertCategory(String s, int nmno, SqlSessionTemplate sqlSession) throws NaruException {
		Category c = new Category();
		c.setCaName(s);
		c.setNmno(nmno);
		c.setCaLevel(0);

		//존재하는지 체크한다
		ArrayList<Category> clist = (ArrayList) sqlSession.selectList("Naru.selectCategoryAll", nmno);
		
		for(Category ca : clist){
			if(ca.getCaName().equals(s)){
				sqlSession.update("Naru.restoreCategory", ca.getCano());
				return;
			}
		}
		
		//없으면 카테고리를 추가한다
		int result = sqlSession.insert("Naru.insertCategory", c);
		
		if(result<0){
			throw new NaruException("생성 실패");
		}else{
			
		}
	}

	@Override
	public ArrayList<Category> selectCategoryList(SqlSessionTemplate sqlSession, int nmno) {
		
		ArrayList<Category> list = (ArrayList) sqlSession.selectList("Naru.selectCategoryAll", nmno);
		
		return list;
	}

	@Override
	public void disableCategory(SqlSessionTemplate sqlSession, String caName, int nmno) {
		Category c = new Category();
		c.setCaName(caName);
		c.setNmno(nmno);
		int result = sqlSession.update("Naru.disableCategory",c);
		
		if(result <= 0){
			System.out.println("해당하는 카테고리 없음");
		}
	}

	@Override
	public void updateTheme(int nmno, String themeValue, String boardValue, String fontValue, SqlSessionTemplate sqlSession) {
		Theme t = new Theme();
		
		t.setNmno(nmno);
		t.setColor(themeValue);
		t.setBoard(boardValue);
		t.setFont(fontValue);
		
		int result = sqlSession.update("Naru.updateTheme", t);
	}

	@Override
	public int insertNeighbor(int nmno, int mid, SqlSessionTemplate sqlSession) {
		Neighbor nb = new Neighbor();
		
		System.out.println("인서트중 : " + nmno);
		int ownerMno = sqlSession.selectOne("Narumaru.checkNarumaruOwner", nmno);
				
		nb.setMno(ownerMno);
		nb.setUser_mno(mid);
		
		sqlSession.insert("Neighbor.myPageNeighborInsert", nb);
		
		return ownerMno;
	}

	@Override
	public ArrayList<Narumaru> selectNeighborList(int nmno, SqlSessionTemplate sqlSession) {
		//해당 나루의 주인을 찾아옴
		int mno = sqlSession.selectOne("Narumaru.checkNarumaruOwner", nmno);
		
		//해당 나루의 이웃들을 가져옴
		ArrayList<Narumaru> list = (ArrayList)sqlSession.selectList("Narumaru.selectNeighborList", mno);
		
		return list;
	}

	@Override
	public void deleteNeighbor(int nmno, int mid, SqlSessionTemplate sqlSession) {
		Neighbor nb = new Neighbor();
		
		nb.setUser_mno(mid);
		nb.setMno(sqlSession.selectOne("Narumaru.checkNarumaruOwner", nmno));
		
		sqlSession.delete("Neighbor.myPageNeighborDelete", nb);
	}

	//mno로 그사람의 나루를 가져온다
	@Override
	public int checkNaruByMno(int mno, SqlSessionTemplate sqlSession) {
		int nmno = sqlSession.selectOne("Narumaru.checkNaruByMno", mno);
		
		return nmno;
	}

}

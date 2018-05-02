package com.kh.narumaru.common.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.narumaru.common.model.exception.NeighborDeleteException;
import com.kh.narumaru.common.model.exception.NeighborInsertException;
import com.kh.narumaru.common.model.vo.Neighbor;
import com.kh.narumaru.common.model.vo.PageInfo;

@Repository
public class NeighborDaoImpl implements NeighborDao {

	@Override
	public int getNeighborListCount(SqlSessionTemplate sqlSession, int mno) {
		
		int count = 0;
		
		Integer result = sqlSession.selectOne("Neighbor.getNeighborListCount",mno);
		
		if(result != null){
			count = result;
		}
		
		return count;
	}

	@Override
	public ArrayList<Neighbor> getNeighborList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		ArrayList<Neighbor> nList = (ArrayList) sqlSession.selectList("Neighbor.getneighborList", pi);
		
		return nList;
	}

	@Override
	public void myPageNeighborInsert(SqlSessionTemplate sqlSession, Neighbor n) throws NeighborInsertException {
		
		int result = sqlSession.insert("Neighbor.myPageNeighborInsert", n);
		
		if(result <= 0){
			throw new NeighborInsertException("마이페이지 - 이웃 추가 실패!");
		}
		
	}

	@Override
	public void myPageNeighborDelete(SqlSessionTemplate sqlSession, Neighbor n) throws NeighborDeleteException {
		
		int result = sqlSession.delete("Neighbor.myPageNeighborDelete", n);
		
		if(result <= 0){
			throw new NeighborDeleteException("마이페이지 - 이웃 삭제 실패!");
		}
		
	}

}

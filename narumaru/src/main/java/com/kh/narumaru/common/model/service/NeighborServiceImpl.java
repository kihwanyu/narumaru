package com.kh.narumaru.common.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.narumaru.common.model.dao.NeighborDao;
import com.kh.narumaru.common.model.exception.NeighborDeleteException;
import com.kh.narumaru.common.model.exception.NeighborInsertException;
import com.kh.narumaru.common.model.vo.Neighbor;
import com.kh.narumaru.common.model.vo.PageInfo;

@Service
public class NeighborServiceImpl implements NeighborService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private NeighborDao nd;
	
	@Override
	public int getNeighborListCount(int mno) {
		
		int result = nd.getNeighborListCount(sqlSession, mno);
		
		return result;
	}

	@Override
	public ArrayList<Neighbor> selectNeighborList(PageInfo pi) {
		
		ArrayList<Neighbor> nList = nd.getNeighborList(sqlSession, pi);
		
		return nList;
	}

	@Override
	public void myPageNeighborInsert(Neighbor n) throws NeighborInsertException {
		
		nd.myPageNeighborInsert(sqlSession, n);
		
	}

	@Override
	public void myPageNeighborDelete(Neighbor n) throws NeighborDeleteException {
		
		nd.myPageNeighborDelete(sqlSession, n);
	}

}

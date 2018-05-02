package com.kh.narumaru.common.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.narumaru.common.model.exception.NeighborDeleteException;
import com.kh.narumaru.common.model.exception.NeighborInsertException;
import com.kh.narumaru.common.model.vo.Neighbor;
import com.kh.narumaru.common.model.vo.PageInfo;

public interface NeighborDao {

	int getNeighborListCount(SqlSessionTemplate sqlSession, int mno);

	ArrayList<Neighbor> getNeighborList(SqlSessionTemplate sqlSession, PageInfo pi);

	void myPageNeighborInsert(SqlSessionTemplate sqlSession, Neighbor n) throws NeighborInsertException;

	void myPageNeighborDelete(SqlSessionTemplate sqlSession, Neighbor n) throws NeighborDeleteException;

}

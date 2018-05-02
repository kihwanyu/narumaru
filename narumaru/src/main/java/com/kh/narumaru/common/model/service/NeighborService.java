package com.kh.narumaru.common.model.service;

import java.util.ArrayList;

import com.kh.narumaru.common.model.exception.NeighborDeleteException;
import com.kh.narumaru.common.model.exception.NeighborInsertException;
import com.kh.narumaru.common.model.vo.Neighbor;
import com.kh.narumaru.common.model.vo.PageInfo;

public interface NeighborService {

	int getNeighborListCount(int mno);

	ArrayList<Neighbor> selectNeighborList(PageInfo pi);

	void myPageNeighborInsert(Neighbor n) throws NeighborInsertException;

	void myPageNeighborDelete(Neighbor n) throws NeighborDeleteException;

}

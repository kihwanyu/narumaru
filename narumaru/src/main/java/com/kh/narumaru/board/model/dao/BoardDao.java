package com.kh.narumaru.board.model.dao;

import java.util.ArrayList;

import com.kh.narumaru.board.model.vo.Board;

public interface BoardDao {

	ArrayList<Board> getBoardListAll(int nmno);

}

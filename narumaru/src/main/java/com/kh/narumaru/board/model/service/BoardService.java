package com.kh.narumaru.board.model.service;

import java.util.ArrayList;

import com.kh.narumaru.board.model.vo.Board;

public interface BoardService {

	ArrayList<Board> getBoardListAll(int nmno);

}

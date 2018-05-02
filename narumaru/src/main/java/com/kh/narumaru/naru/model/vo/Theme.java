package com.kh.narumaru.naru.model.vo;

import org.springframework.stereotype.Component;

@Component
public class Theme implements java.io.Serializable{
	private int tno;
	private int nmno;
	private String color;
	private String font;
	private String board;
	
	public Theme(){}
	
	public Theme(int tno, int nmno, String color, String board, String font) {
		this.tno = tno;
		this.nmno = nmno;
		this.color = color;
		this.font = font;
		this.board = board;
	}

	public int getTno() {
		return tno;
	}

	public void setTno(int tno) {
		this.tno = tno;
	}

	public int getNmno() {
		return nmno;
	}

	public void setNmno(int nmno) {
		this.nmno = nmno;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getBoard() {
		return board;
	}

	public void setBoard(String board) {
		this.board = board;
	}

	public String getFont() {
		return font;
	}

	public void setFont(String font) {
		this.font = font;
	}

	@Override
	public String toString() {
		return "Theme [tno=" + tno + ", nmno=" + nmno + ", color=" + color + ", board=" + board + ", font=" + font
				+ "]";
	}
	
	
}

package com.kh.narumaru.naru.model.vo;

public class Theme {
	private int tno;
	private int nmno;
	private String theme;
	private String board;
	private String font;
	
	public Theme(){}
	
	public Theme(int tno, int nmno, String theme, String board, String font) {
		this.tno = tno;
		this.nmno = nmno;
		this.theme = theme;
		this.board = board;
		this.font = font;
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

	public String getTheme() {
		return theme;
	}

	public void setTheme(String theme) {
		this.theme = theme;
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
		return "Theme [tno=" + tno + ", nmno=" + nmno + ", theme=" + theme + ", board=" + board + ", font=" + font
				+ "]";
	}
	
	
}

package com.kh.narumaru.board.model.vo;

import java.sql.Date;

public class Board implements java.io.Serializable {
	public int bno;
	public int bTno;
	public int bType;
	public String bTitle;
	public String bContent;
	public String bHidden;
	public int mno;
	public String bWriter;
	public Date createDate;
	public Date modifyDate;
	public String status;
	public int nmno;
	public int cano;
	public int cno;
	
	public Board(){}

	public Board(int bno, int bTno, int bType, String bTitle, String bContent, String bHidden, int mno, String bWriter,
			Date createDate, Date modifyDate, String status, int nmno, int cano, int cno) {
		super();
		this.bno = bno;
		this.bTno = bTno;
		this.bType = bType;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bHidden = bHidden;
		this.mno = mno;
		this.bWriter = bWriter;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.status = status;
		this.nmno = nmno;
		this.cano = cano;
		this.cno = cno;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public int getbTno() {
		return bTno;
	}

	public void setbTno(int bTno) {
		this.bTno = bTno;
	}

	public int getbType() {
		return bType;
	}

	public void setbType(int bType) {
		this.bType = bType;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public String getbHidden() {
		return bHidden;
	}

	public void setbHidden(String bHidden) {
		this.bHidden = bHidden;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getbWriter() {
		return bWriter;
	}

	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getNmno() {
		return nmno;
	}

	public void setNmno(int nmno) {
		this.nmno = nmno;
	}

	public int getCano() {
		return cano;
	}

	public void setCano(int cano) {
		this.cano = cano;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	@Override
	public String toString() {
		return "Board [bno=" + bno + ", bTno=" + bTno + ", bType=" + bType + ", bTitle=" + bTitle + ", bContent="
				+ bContent + ", bHidden=" + bHidden + ", mno=" + mno + ", bWriter=" + bWriter + ", createDate="
				+ createDate + ", modifyDate=" + modifyDate + ", status=" + status + ", nmno=" + nmno + ", cano=" + cano
				+ ", cno=" + cno + "]";
	}

	
}

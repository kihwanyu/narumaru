package com.kh.narumaru.declaration.model.vo;

import java.sql.Date;

public class Declaration implements java.io.Serializable{
	private int polNo;
	private String polType;
	private int mno;
	private int bno;
	private String polIu;
	private Date polDate;
	private int nmno;

	public Declaration() {
	}

	public Declaration(int polNo, String polType, int mno, int bno, String polIu, Date polDate, int nmno) {
		super();
		this.polNo = polNo;
		this.polType = polType;
		this.mno = mno;
		this.bno = bno;
		this.polIu = polIu;
		this.polDate = polDate;
		this.nmno = nmno;
	}

	public int getPolNo() {
		return polNo;
	}

	public void setPolNo(int polNo) {
		this.polNo = polNo;
	}

	public String getPolType() {
		return polType;
	}

	public void setPolType(String polType) {
		this.polType = polType;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getPolIu() {
		return polIu;
	}

	public void setPolIu(String polIu) {
		this.polIu = polIu;
	}

	public Date getPolDate() {
		return polDate;
	}

	public void setPolDate(Date polDate) {
		this.polDate = polDate;
	}

	public int getNmno() {
		return nmno;
	}

	public void setNmno(int nmno) {
		this.nmno = nmno;
	}

	@Override
	public String toString() {
		return "Declaration [polNo=" + polNo + ", polType=" + polType + ", mno=" + mno + ", bno=" + bno + ", polIu="
				+ polIu + ", nmno=" + nmno + "]";
	}

	
}

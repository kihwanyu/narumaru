package com.kh.narumaru.maru.model.vo;

import java.sql.Date;

public class MaruMember implements java.io.Serializable{
	private int conno;
	private int mno;
	private int conLevel;
	private Date enrollDate;
	private Date deleteDate;
	private String status;
	private int nmno;
	
	public MaruMember(){}

	public MaruMember(int conno, int mno, int conLevel, Date enrollDate, Date deleteDate, String status, int nmno) {
		super();
		this.conno = conno;
		this.mno = mno;
		this.conLevel = conLevel;
		this.enrollDate = enrollDate;
		this.deleteDate = deleteDate;
		this.status = status;
		this.nmno = nmno;
	}

	public int getConno() {
		return conno;
	}

	public void setConno(int conno) {
		this.conno = conno;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public int getConLevel() {
		return conLevel;
	}

	public void setConLevel(int conLevel) {
		this.conLevel = conLevel;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getDeleteDate() {
		return deleteDate;
	}

	public void setDeleteDate(Date deleteDate) {
		this.deleteDate = deleteDate;
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

	@Override
	public String toString() {
		return "MaruMember [conno=" + conno + ", mno=" + mno + ", conLevel=" + conLevel + ", enrollDate=" + enrollDate
				+ ", deleteDate=" + deleteDate + ", status=" + status + ", nmno=" + nmno + "]";
	}
	
	
}

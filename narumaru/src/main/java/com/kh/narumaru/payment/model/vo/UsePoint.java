package com.kh.narumaru.payment.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class UsePoint implements java.io.Serializable{
	private int pno;
	private String pContent;
	private Date pDate;
	private int mno;
	private int amount;
	private int bno;
	
	public UsePoint(){}

	public UsePoint(int pno, String pContent, Date pDate, int mno, int amount, int bno) {
		super();
		this.pno = pno;
		this.pContent = pContent;
		this.pDate = pDate;
		this.mno = mno;
		this.amount = amount;
		this.bno = bno;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getpContent() {
		return pContent;
	}

	public void setpContent(String pContent) {
		this.pContent = pContent;
	}

	public Date getpDate() {
		return pDate;
	}

	public void setpDate(Date pDate) {
		this.pDate = pDate;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	@Override
	public String toString() {
		return "UsePoint [pno=" + pno + ", pContent=" + pContent + ", pDate=" + pDate + ", mno=" + mno + ", amount="
				+ amount + ", bno=" + bno + "]";
	}

	
}

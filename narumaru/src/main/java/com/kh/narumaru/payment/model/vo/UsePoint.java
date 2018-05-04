package com.kh.narumaru.payment.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class UsePoint implements java.io.Serializable{
	private int pno;
	private String pContent;
	private Date date;
	private int mno;
	private int amount;
	private int bno;
	
	public UsePoint(){}

	public UsePoint(int pno, String pContent, Date date, int mno, int amount, int bno) {
		super();
		this.pno = pno;
		this.pContent = pContent;
		this.date = date;
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

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
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
		return "UsePoint [pno=" + pno + ", pContent=" + pContent + ", date=" + date + ", mno=" + mno + ", amount="
				+ amount + ", bno=" + bno + "]";
	}
	
	
}

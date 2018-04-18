package com.kh.narumaru.payment.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class UsePoint implements java.io.Serializable{
	private int pno;
	private String pContent;
	private Date useDay;
	private int mno;
	private int amount;
	
	public UsePoint(){}
	
	public UsePoint(int pno, String pContent, Date useDay, int mno, int amount) {
		super();
		this.pno = pno;
		this.pContent = pContent;
		this.useDay = useDay;
		this.mno = mno;
		this.amount = amount;
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

	public Date getUseDay() {
		return useDay;
	}

	public void setUseDay(Date useDay) {
		this.useDay = useDay;
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

	@Override
	public String toString() {
		return "UsePoint [pno=" + pno + ", pContent=" + pContent + ", mno=" + mno + ", amount=" + amount + "]";
	}
	
	
	
}

package com.kh.narumaru.payment.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class Stats implements Serializable {
	private int mno;
	private int year;
	private String month;
	private int amount;
	public Stats() {
		super();
	}
	public Stats(int mno, int year, String month, int amount) {
		super();
		this.mno = mno;
		this.year = year;
		this.month = month;
		this.amount = amount;
	}

	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	@Override
	public String toString() {
		return "Stats [mno=" + mno + ", year=" + year + ", month=" + month + ", amount=" + amount + "]";
	}
	
	
}

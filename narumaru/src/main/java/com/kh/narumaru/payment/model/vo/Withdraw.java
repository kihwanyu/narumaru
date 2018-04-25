package com.kh.narumaru.payment.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Withdraw {
	private int wno;
	private Date w_date;
	private int mno;
	private int point;
	private String bcode;
	private String bank_name;
	private String account_number;
	private String account_holder;
	private String w_value;
	
	public Withdraw() {
		super();
	}
	
	public Withdraw(int wno, Date w_date, int mno, int point, String bcode, String bank_name, String account_number,
			String account_holder, String w_value) {
		super();
		this.wno = wno;
		this.w_date = w_date;
		this.mno = mno;
		this.point = point;
		this.bcode = bcode;
		this.bank_name = bank_name;
		this.account_number = account_number;
		this.account_holder = account_holder;
		this.w_value = w_value;
	}
	
	public int getWno() {
		return wno;
	}
	public void setWno(int wno) {
		this.wno = wno;
	}
	public Date getW_date() {
		return w_date;
	}
	public void setW_date(Date w_date) {
		this.w_date = w_date;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getBcode() {
		return bcode;
	}
	public void setBcode(String bcode) {
		this.bcode = bcode;
	}
	public String getBank_name() {
		return bank_name;
	}
	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}
	public String getAccount_number() {
		return account_number;
	}
	public void setAccount_number(String account_number) {
		this.account_number = account_number;
	}
	public String getAccount_holder() {
		return account_holder;
	}
	public void setAccount_holder(String account_holder) {
		this.account_holder = account_holder;
	}
	public String getW_value() {
		return w_value;
	}
	public void setW_value(String w_value) {
		this.w_value = w_value;
	}
	
	@Override
	public String toString() {
		return "Withdraw [wno=" + wno + ", w_date=" + w_date + ", mno=" + mno + ", point=" + point + ", bcode=" + bcode
				+ ", bank_name=" + bank_name + ", account_number=" + account_number + ", account_holder="
				+ account_holder + ", w_value=" + w_value + "]";
	}
}

package com.kh.narumaru.payment.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Withdraw implements Serializable{
	private int wno;
	private Date resister_date;
	private String resister_dateStr;
	private Date withdraw_date;
	private String withdraw_dateStr;
	private int mno;
	private int point;
	private int amount;
	private String bcode;
	private String bank_name;
	private String account_number;
	private String account_holder;
	private String status;
	
	public Withdraw() {
		super();
	}

	public Withdraw(int wno, Date resister_date, String resister_dateStr, Date withdraw_date, String withdraw_dateStr,
			int mno, int point, int amount, String bcode, String bank_name, String account_number,
			String account_holder, String status) {
		super();
		this.wno = wno;
		this.resister_date = resister_date;
		this.resister_dateStr = resister_dateStr;
		this.withdraw_date = withdraw_date;
		this.withdraw_dateStr = withdraw_dateStr;
		this.mno = mno;
		this.point = point;
		this.amount = amount;
		this.bcode = bcode;
		this.bank_name = bank_name;
		this.account_number = account_number;
		this.account_holder = account_holder;
		this.status = status;
	}

	public int getWno() {
		return wno;
	}

	public void setWno(int wno) {
		this.wno = wno;
	}

	public Date getResister_date() {
		return resister_date;
	}

	public void setResister_date(Date resister_date) {
		this.resister_date = resister_date;
	}

	public String getResister_dateStr() {
		return resister_dateStr;
	}

	public void setResister_dateStr(String resister_dateStr) {
		this.resister_dateStr = resister_dateStr;
	}

	public Date getWithdraw_date() {
		return withdraw_date;
	}

	public void setWithdraw_date(Date withdraw_date) {
		this.withdraw_date = withdraw_date;
	}

	public String getWithdraw_dateStr() {
		return withdraw_dateStr;
	}

	public void setWithdraw_dateStr(String withdraw_dateStr) {
		this.withdraw_dateStr = withdraw_dateStr;
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

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Withdraw [wno=" + wno + ", resister_date=" + resister_date + ", resister_dateStr=" + resister_dateStr
				+ ", withdraw_date=" + withdraw_date + ", withdraw_dateStr=" + withdraw_dateStr + ", mno=" + mno
				+ ", point=" + point + ", amount=" + amount + ", bcode=" + bcode + ", bank_name=" + bank_name
				+ ", account_number=" + account_number + ", account_holder=" + account_holder + ", status=" + status
				+ "]";
	}
	
}

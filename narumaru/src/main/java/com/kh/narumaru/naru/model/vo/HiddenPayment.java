package com.kh.narumaru.naru.model.vo;

import org.springframework.stereotype.Component;

@Component
public class HiddenPayment implements java.io.Serializable {
	private int payNo;
	private int mno;
	private int bno;
	private String buyDate;
	
	public HiddenPayment(){}

	public HiddenPayment(int payNo, int mno, int bno, String buyDate) {
		super();
		this.payNo = payNo;
		this.mno = mno;
		this.bno = bno;
		this.buyDate = buyDate;
	}

	public int getPayNo() {
		return payNo;
	}

	public void setPayNo(int payNo) {
		this.payNo = payNo;
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

	public String getBuyDate() {
		return buyDate;
	}

	public void setBuyDate(String buyDate) {
		this.buyDate = buyDate;
	}

	@Override
	public String toString() {
		return "HiddenPayment [payNo=" + payNo + ", mno=" + mno + ", bno=" + bno + ", buyDate=" + buyDate + "]";
	}
	
	
}

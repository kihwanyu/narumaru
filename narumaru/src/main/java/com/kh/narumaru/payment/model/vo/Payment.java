package com.kh.narumaru.payment.model.vo;

import java.sql.Date;

public class Payment implements java.io.Serializable {
	private int  payNo;
	private int mno;
	private String impUid;
	private int amount;
	private String payPg;
	private String payMethod;
	private String merchantUid;
	private String payName;
	private String buyerName;
	private String buyerAddr;
	private String buyerPostcode;
	private String applyNum;
	private String buyerEmail;
	private String status;
	private Date payDay;
	
	public Payment(){}

	public Payment(int payNo, int mno, String impUid, int amount, String payPg, String payMethod, String merchantUid,
			String payName, String buyerName, String buyerAddr, String buyerPostcode, String applyNum,
			String buyerEmail, String status, Date payDay) {
		this.payNo = payNo;
		this.mno = mno;
		this.impUid = impUid;
		this.amount = amount;
		this.payPg = payPg;
		this.payMethod = payMethod;
		this.merchantUid = merchantUid;
		this.payName = payName;
		this.buyerName = buyerName;
		this.buyerAddr = buyerAddr;
		this.buyerPostcode = buyerPostcode;
		this.applyNum = applyNum;
		this.buyerEmail = buyerEmail;
		this.status = status;
		this.payDay = payDay;
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

	public String getImpUid() {
		return impUid;
	}

	public void setImpUid(String impUid) {
		this.impUid = impUid;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getPayPg() {
		return payPg;
	}

	public void setPayPg(String payPg) {
		this.payPg = payPg;
	}

	public String getPayMethod() {
		return payMethod;
	}

	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}

	public String getMerchantUid() {
		return merchantUid;
	}

	public void setMerchantUid(String merchantUid) {
		this.merchantUid = merchantUid;
	}

	public String getPayName() {
		return payName;
	}

	public void setPayName(String payName) {
		this.payName = payName;
	}

	public String getBuyerName() {
		return buyerName;
	}

	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
	}

	public String getBuyerAddr() {
		return buyerAddr;
	}

	public void setBuyerAddr(String buyerAddr) {
		this.buyerAddr = buyerAddr;
	}

	public String getBuyerPostcode() {
		return buyerPostcode;
	}

	public void setBuyerPostcode(String buyerPostcode) {
		this.buyerPostcode = buyerPostcode;
	}

	public String getApplyNum() {
		return applyNum;
	}

	public void setApplyNum(String applyNum) {
		this.applyNum = applyNum;
	}

	public String getBuyerEmail() {
		return buyerEmail;
	}

	public void setBuyerEmail(String buyerEmail) {
		this.buyerEmail = buyerEmail;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getPayDay() {
		return payDay;
	}

	public void setPayDay(Date payDay) {
		this.payDay = payDay;
	}

	@Override
	public String toString() {
		return "Payment [payNo=" + payNo + ", mno=" + mno + ", impUid=" + impUid + ", amount=" + amount + ", payPg="
				+ payPg + ", payMethod=" + payMethod + ", merchantUid=" + merchantUid + ", payName=" + payName
				+ ", buyerName=" + buyerName + ", buyerAddr=" + buyerAddr + ", buyerPostcode=" + buyerPostcode
				+ ", applyNum=" + applyNum + ", buyerEmail=" + buyerEmail + ", status=" + status + ", payDay=" + payDay
				+ "]";
	}
	
	
	
}

package com.kh.narumaru.payment.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class UsePoint implements java.io.Serializable{
	private int pno;
	private String pContent;
	private String pDate;
	private int mno;
	private int amount;
	private int saller_no;
	private String saller_name;
	private int buyer_no;
	private String buyer_name;
	private int nmno;
	private String nm_title;
	private int bno;
	public UsePoint() {
		super();
	}
	public UsePoint(int pno, String pContent, String pDate, int mno, int amount, int saller_no, String saller_name,
			int buyer_no, String buyer_name, int nmno, String nm_title, int bno) {
		super();
		this.pno = pno;
		this.pContent = pContent;
		this.pDate = pDate;
		this.mno = mno;
		this.amount = amount;
		this.saller_no = saller_no;
		this.saller_name = saller_name;
		this.buyer_no = buyer_no;
		this.buyer_name = buyer_name;
		this.nmno = nmno;
		this.nm_title = nm_title;
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
	public String getpDate() {
		return pDate;
	}
	public void setpDate(String pDate) {
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
	public int getSaller_no() {
		return saller_no;
	}
	public void setSaller_no(int saller_no) {
		this.saller_no = saller_no;
	}
	public String getSaller_name() {
		return saller_name;
	}
	public void setSaller_name(String saller_name) {
		this.saller_name = saller_name;
	}
	public int getBuyer_no() {
		return buyer_no;
	}
	public void setBuyer_no(int buyer_no) {
		this.buyer_no = buyer_no;
	}
	public String getBuyer_name() {
		return buyer_name;
	}
	public void setBuyer_name(String buyer_name) {
		this.buyer_name = buyer_name;
	}
	public int getNmno() {
		return nmno;
	}
	public void setNmno(int nmno) {
		this.nmno = nmno;
	}
	public String getNm_title() {
		return nm_title;
	}
	public void setNm_title(String nm_title) {
		this.nm_title = nm_title;
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
				+ amount + ", saller_no=" + saller_no + ", saller_name=" + saller_name + ", buyer_no=" + buyer_no
				+ ", buyer_name=" + buyer_name + ", nmno=" + nmno + ", nm_title=" + nm_title + ", bno=" + bno + "]";
	}
	
}

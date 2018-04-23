package com.kh.narumaru.member.model.vo;

import org.springframework.stereotype.Component;

@Component
public class MChannel {
	private int mcno;
	private int mno;
	private int cno;
	
	public MChannel() {
		super();
	}

	public MChannel(int mcno, int mno, int cno) {
		super();
		this.mcno = mcno;
		this.mno = mno;
		this.cno = cno;
	}

	public int getMcno() {
		return mcno;
	}

	public void setMcno(int mcno) {
		this.mcno = mcno;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	@Override
	public String toString() {
		return "MChannel [mcno=" + mcno + ", mno=" + mno + ", cno=" + cno + "]";
	}
	
	
}

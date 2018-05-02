package com.kh.narumaru.naru.model.vo;

import org.springframework.stereotype.Component;

@Component
public class Neighbor implements java.io.Serializable{
	private int nno;
	private int mno;
	private int neighborMno;
	
	public Neighbor(){}

	public Neighbor(int nno, int mno, int neighborMno) {
		super();
		this.nno = nno;
		this.mno = mno;
		this.neighborMno = neighborMno;
	}

	public int getNno() {
		return nno;
	}

	public void setNno(int nno) {
		this.nno = nno;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public int getNeighborMno() {
		return neighborMno;
	}

	public void setNeighborMno(int neighborMno) {
		this.neighborMno = neighborMno;
	}

	@Override
	public String toString() {
		return "Neighbor [nno=" + nno + ", mno=" + mno + ", neighborMno=" + neighborMno + "]";
	}
	
}

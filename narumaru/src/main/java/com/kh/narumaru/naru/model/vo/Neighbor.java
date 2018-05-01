package com.kh.narumaru.naru.model.vo;

import org.springframework.stereotype.Component;

@Component
public class Neighbor implements java.io.Serializable{
	private int nno;
	private int nmno;
	private int neighborNmno;
	
	public Neighbor(){}

	public Neighbor(int nno, int nmno, int neighborNmno) {
		super();
		this.nno = nno;
		this.nmno = nmno;
		this.neighborNmno = neighborNmno;
	}

	public int getNno() {
		return nno;
	}

	public void setNno(int nno) {
		this.nno = nno;
	}

	public int getNmno() {
		return nmno;
	}

	public void setNmno(int nmno) {
		this.nmno = nmno;
	}

	public int getNeighborNmno() {
		return neighborNmno;
	}

	public void setNeighborNmno(int neighborNmno) {
		this.neighborNmno = neighborNmno;
	}
	
	
}

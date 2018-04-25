package com.kh.narumaru.naru.model.vo;

import org.springframework.stereotype.Component;

@Component
public class Category implements java.io.Serializable{
	private int cano;
	private String caName;
	private int nmno;
	private int refCano;
	private int caLevel;
	private String status;
	
	public Category(){}

	public Category(int cano, String caName, int nmno, int refCano, int caLevel, String status) {
		this.cano = cano;
		this.caName = caName;
		this.nmno = nmno;
		this.refCano = refCano;
		this.caLevel = caLevel;
		this.status = status;
	}

	public int getCano() {
		return cano;
	}

	public void setCano(int cano) {
		this.cano = cano;
	}

	public String getCaName() {
		return caName;
	}

	public void setCaName(String caName) {
		this.caName = caName;
	}

	public int getNmno() {
		return nmno;
	}

	public void setNmno(int nmno) {
		this.nmno = nmno;
	}

	public int getRefCano() {
		return refCano;
	}

	public void setRefCano(int refCano) {
		this.refCano = refCano;
	}

	public int getCaLevel() {
		return caLevel;
	}

	public void setCaLevel(int caLevel) {
		this.caLevel = caLevel;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Category [cano=" + cano + ", caName=" + caName + ", nmno=" + nmno + ", refCano=" + refCano
				+ ", caLevel=" + caLevel + ", status=" + status + "]";
	}
	
	
}

package com.kh.narumaru.narumaru.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class InvateMember implements Serializable {
	private int ino;
	private String nmno;
	private String nm_title;
	private String maru_manager;
	public InvateMember() {
		super();
	}
	public InvateMember(int ino, String nmno, String nm_title, String maru_manager) {
		super();
		this.ino = ino;
		this.nmno = nmno;
		this.nm_title = nm_title;
		this.maru_manager = maru_manager;
	}
	public int getIno() {
		return ino;
	}
	public void setIno(int ino) {
		this.ino = ino;
	}
	public String getNmno() {
		return nmno;
	}
	public void setNmno(String nmno) {
		this.nmno = nmno;
	}
	public String getNm_title() {
		return nm_title;
	}
	public void setNm_title(String nm_title) {
		this.nm_title = nm_title;
	}
	public String getMaru_manager() {
		return maru_manager;
	}
	public void setMaru_manager(String maru_manager) {
		this.maru_manager = maru_manager;
	}
	@Override
	public String toString() {
		return "InvateMember [ino=" + ino + ", nmno=" + nmno + ", nm_title=" + nm_title + ", maru_manager="
				+ maru_manager + "]";
	}
	 
}

package com.kh.narumaru.member.model.vo;

import org.springframework.stereotype.Component;

@Component
public class Channel {
	private int cno;
	private String cname;
	private String cphoto;
	
	public Channel() {
		super();
	}
	
	public Channel(int cno, String cname, String cphoto) {
		super();
		this.cno = cno;
		this.cname = cname;
		this.cphoto = cphoto;
	}

	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getCphoto() {
		return cphoto;
	}
	public void setCphoto(String cphoto) {
		this.cphoto = cphoto;
	}

	@Override
	public String toString() {
		return "Chanel [cno=" + cno + ", cname=" + cname + ", cphoto=" + cphoto + "]";
	}
	
	
}

package com.kh.narumaru.common.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class Alarm implements Serializable{
	private int ano;
	private int atno;
	private String type_name;
	private String alarm_date;
	private int receive_mno;
	private String receive_nicname;
	private int send_mno;
	private String send_nicname;
	private int send_nmno;
	private String nm_title;
	private int send_bno;
	private String b_title;
	private String b_content;
	private int status;
	
	public Alarm() {
		super();
	}

	public Alarm(int ano, int atno, String type_name, String alarm_date, int receive_mno, String receive_nicname,
			int send_mno, String send_nicname, int send_nmno, String nm_title, int send_bno, String b_title,
			String b_content, int status) {
		super();
		this.ano = ano;
		this.atno = atno;
		this.type_name = type_name;
		this.alarm_date = alarm_date;
		this.receive_mno = receive_mno;
		this.receive_nicname = receive_nicname;
		this.send_mno = send_mno;
		this.send_nicname = send_nicname;
		this.send_nmno = send_nmno;
		this.nm_title = nm_title;
		this.send_bno = send_bno;
		this.b_title = b_title;
		this.b_content = b_content;
		this.status = status;
	}

	public int getAno() {
		return ano;
	}

	public void setAno(int ano) {
		this.ano = ano;
	}

	public int getAtno() {
		return atno;
	}

	public void setAtno(int atno) {
		this.atno = atno;
	}

	public String getType_name() {
		return type_name;
	}

	public void setType_name(String type_name) {
		this.type_name = type_name;
	}

	public String getAlarm_date() {
		return alarm_date;
	}

	public void setAlarm_date(String alarm_date) {
		this.alarm_date = alarm_date;
	}

	public int getReceive_mno() {
		return receive_mno;
	}

	public void setReceive_mno(int receive_mno) {
		this.receive_mno = receive_mno;
	}

	public String getReceive_nicname() {
		return receive_nicname;
	}

	public void setReceive_nicname(String receive_nicname) {
		this.receive_nicname = receive_nicname;
	}

	public int getSend_mno() {
		return send_mno;
	}

	public void setSend_mno(int send_mno) {
		this.send_mno = send_mno;
	}

	public String getSend_nicname() {
		return send_nicname;
	}

	public void setSend_nicname(String send_nicname) {
		this.send_nicname = send_nicname;
	}

	public int getSend_nmno() {
		return send_nmno;
	}

	public void setSend_nmno(int send_nmno) {
		this.send_nmno = send_nmno;
	}

	public String getNm_title() {
		return nm_title;
	}

	public void setNm_title(String nm_title) {
		this.nm_title = nm_title;
	}

	public int getSend_bno() {
		return send_bno;
	}

	public void setSend_bno(int send_bno) {
		this.send_bno = send_bno;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Alarm [ano=" + ano + ", atno=" + atno + ", type_name=" + type_name + ", alarm_date=" + alarm_date
				+ ", receive_mno=" + receive_mno + ", receive_nicname=" + receive_nicname + ", send_mno=" + send_mno
				+ ", send_nicname=" + send_nicname + ", send_nmno=" + send_nmno + ", nm_title=" + nm_title
				+ ", send_bno=" + send_bno + ", b_title=" + b_title + ", b_content=" + b_content + ", status=" + status
				+ "]";
	}
	
}

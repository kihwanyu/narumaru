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
	private int send_mno;
	private int send_nmno;
	private int send_bno;
	private String title;
	private String content;
	private int status;
	
	public Alarm() {
		super();
	}

	public Alarm(int ano, int atno, String type_name, String alarm_date, int receive_mno, int send_mno, int send_nmno,
			String title, String content, int status) {
		super();
		this.ano = ano;
		this.atno = atno;
		this.type_name = type_name;
		this.alarm_date = alarm_date;
		this.receive_mno = receive_mno;
		this.send_mno = send_mno;
		this.send_nmno = send_nmno;
		this.title = title;
		this.content = content;
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

	public int getSend_mno() {
		return send_mno;
	}

	public void setSend_mno(int send_mno) {
		this.send_mno = send_mno;
	}

	public int getSend_nmno() {
		return send_nmno;
	}

	public void setSend_nmno(int send_nmno) {
		this.send_nmno = send_nmno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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
				+ ", receive_mno=" + receive_mno + ", send_mno=" + send_mno + ", send_nmno=" + send_nmno + ", title="
				+ title + ", content=" + content + ", status=" + status + "]";
	}
}

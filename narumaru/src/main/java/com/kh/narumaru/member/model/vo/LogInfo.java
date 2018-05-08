package com.kh.narumaru.member.model.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class LogInfo implements java.io.Serializable{
	
	private int lono;
	private String email;
	private String userIp;
	private String nation;
	private String time;
	private long longIp;
	private int mno;
	private String success_value;
	
	public LogInfo(){}

	public LogInfo(int lono, String email, String userIp, String nation, String time, long longIp, int mno,
			String success_value) {
		super();
		this.lono = lono;
		this.email = email;
		this.userIp = userIp;
		this.nation = nation;
		this.time = time;
		this.longIp = longIp;
		this.mno = mno;
		this.success_value = success_value;
	}

	


	public String getSuccess_value() {
		return success_value;
	}

	public void setSuccess_value(String success_value) {
		this.success_value = success_value;
	}

	public int getLono() {
		return lono;
	}

	public void setLono(int lono) {
		this.lono = lono;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public long getLongIp() {
		return longIp;
	}

	public void setLongIp(long longIp) {
		this.longIp = longIp;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUserIp() {
		return userIp;
	}

	public void setUserIp(String userIp) {
		this.userIp = userIp;
	}

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	@Override
	public String toString() {
		return "LogInfo [lono=" + lono + ", email=" + email + ", userIp=" + userIp + ", nation=" + nation + ", time="
				+ time + ", longIp=" + longIp + ", mno=" + mno + ", success_value=" + success_value + "]";
	}

	
	
	
	
}

package com.kh.narumaru.member.model.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class LogInfo implements java.io.Serializable{
	
	private String email;
	private String userIp;
	private String nation;
	private String time;
	private long longIp;
	
	public LogInfo(){}

	public LogInfo(String email, String userIp, String nation, String time, long longIp) {
		super();
		this.email = email;
		this.userIp = userIp;
		this.nation = nation;
		this.time = time;
		this.longIp = longIp;
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
		return "LogInfo [email=" + email + ", userIp=" + userIp + ", nation=" + nation + ", time=" + time + ", longIp="
				+ longIp + "]";
	}
	
	
	
}

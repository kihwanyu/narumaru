package com.kh.narumaru.common.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class Neighbor implements Serializable{
	private int nno;
	private int mno;
	private int user_mno;
	private String email;
	private String nicName;
	private String profileName;
	private int nmno;
	private String nm_title;
	private String result;
	public Neighbor() {
		super();
	}
	public Neighbor(int nno, int mno, int user_mno, String email, String nicName, String profileName, int nmno,
			String nm_title, String result) {
		super();
		this.nno = nno;
		this.mno = mno;
		this.user_mno = user_mno;
		this.email = email;
		this.nicName = nicName;
		this.profileName = profileName;
		this.nmno = nmno;
		this.nm_title = nm_title;
		this.result = result;
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
	public int getUser_mno() {
		return user_mno;
	}
	public void setUser_mno(int user_mno) {
		this.user_mno = user_mno;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNicName() {
		return nicName;
	}
	public void setNicName(String nicName) {
		this.nicName = nicName;
	}
	public String getProfileName() {
		return profileName;
	}
	public void setProfileName(String profileName) {
		this.profileName = profileName;
	}
	public int getNmno() {
		return nmno;
	}
	public void setNmno(int nmno) {
		this.nmno = nmno;
	}
	public String getNm_title() {
		return nm_title;
	}
	public void setNm_title(String nm_title) {
		this.nm_title = nm_title;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	@Override
	public String toString() {
		return "Neighbor [nno=" + nno + ", mno=" + mno + ", user_mno=" + user_mno + ", email=" + email + ", nicName="
				+ nicName + ", profileName=" + profileName + ", nmno=" + nmno + ", nm_title=" + nm_title + ", result="
				+ result + "]";
	}
	
}

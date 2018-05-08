package com.kh.narumaru.narumaru.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Narumaru implements java.io.Serializable{
	private int nmno;
	private int nmCategory;
	private int cno;
	private String nmTitle;
	private String nmIntro;
	private Date createDate;
	private String isOpen;
	private String status;
	private String profileName;
	private String ownerNickname;
	
	public Narumaru(){}

	public Narumaru(int nmno, int nmCategory, int cno, String nmTitle, String nmIntro, Date createDate, String isOpen,
			String status, String profileName, String ownerNickname) {
		super();
		this.nmno = nmno;
		this.nmCategory = nmCategory;
		this.cno = cno;
		this.nmTitle = nmTitle;
		this.nmIntro = nmIntro;
		this.createDate = createDate;
		this.isOpen = isOpen;
		this.status = status;
		this.profileName = profileName;
		this.ownerNickname = ownerNickname;
	}

	public int getNmno() {
		return nmno;
	}

	public void setNmno(int nmno) {
		this.nmno = nmno;
	}

	public int getNmCategory() {
		return nmCategory;
	}

	public void setNmCategory(int nmCategory) {
		this.nmCategory = nmCategory;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public String getNmTitle() {
		return nmTitle;
	}

	public void setNmTitle(String nmTitle) {
		this.nmTitle = nmTitle;
	}

	public String getNmIntro() {
		return nmIntro;
	}

	public void setNmIntro(String nmIntro) {
		this.nmIntro = nmIntro;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getIsOpen() {
		return isOpen;
	}

	public void setIsOpen(String isOpen) {
		this.isOpen = isOpen;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getProfileName() {
		return profileName;
	}

	public void setProfileName(String profileName) {
		this.profileName = profileName;
	}

	public String getOwnerNickname() {
		return ownerNickname;
	}

	public void setOwnerNickname(String ownerNickname) {
		this.ownerNickname = ownerNickname;
	}

	@Override
	public String toString() {
		return "Narumaru [nmno=" + nmno + ", nmCategory=" + nmCategory + ", cno=" + cno + ", nmTitle=" + nmTitle
				+ ", nmIntro=" + nmIntro + ", createDate=" + createDate + ", isOpen=" + isOpen + ", status=" + status
				+ ", profileName=" + profileName + ", ownerNickname=" + ownerNickname + "]";
	}
	
	
	
}

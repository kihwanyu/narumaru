package com.kh.narumaru.narumaru.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Board implements java.io.Serializable {
	private int bno;
	private int bTno;
	private int bType;
	private String profileName;
	private String bTitle;
	private String bContent;
	private String bHidden;
	private int mno;
	private String bWriter;
	private String createDate;
	private Date modifyDate;
	private String status;
	private int nmno;
	private int cano;
	private String caname;
	private int cno;
	private int bLevel;
	private int targetBno;
	private String isOpen;
	private int needPoint;
	private int comments;
	private String nmTitle;
	
	public Board(){}

	public Board(int bno, int bTno, int bType, String profileName, String bTitle, String bContent, String bHidden,
			int mno, String bWriter, String createDate, Date modifyDate, String status, int nmno, int cano,
			String caname, int cno, int bLevel, int targetBno, String isOpen, int needPoint, int comments,
			String nmTitle) {
		super();
		this.bno = bno;
		this.bTno = bTno;
		this.bType = bType;
		this.profileName = profileName;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bHidden = bHidden;
		this.mno = mno;
		this.bWriter = bWriter;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.status = status;
		this.nmno = nmno;
		this.cano = cano;
		this.caname = caname;
		this.cno = cno;
		this.bLevel = bLevel;
		this.targetBno = targetBno;
		this.isOpen = isOpen;
		this.needPoint = needPoint;
		this.comments = comments;
		this.nmTitle = nmTitle;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public int getbTno() {
		return bTno;
	}

	public void setbTno(int bTno) {
		this.bTno = bTno;
	}

	public int getbType() {
		return bType;
	}

	public void setbType(int bType) {
		this.bType = bType;
	}

	public String getProfileName() {
		return profileName;
	}

	public void setProfileName(String profileName) {
		this.profileName = profileName;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public String getbHidden() {
		return bHidden;
	}

	public void setbHidden(String bHidden) {
		this.bHidden = bHidden;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getbWriter() {
		return bWriter;
	}

	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getNmno() {
		return nmno;
	}

	public void setNmno(int nmno) {
		this.nmno = nmno;
	}

	public int getCano() {
		return cano;
	}

	public void setCano(int cano) {
		this.cano = cano;
	}

	public String getCaname() {
		return caname;
	}

	public void setCaname(String caname) {
		this.caname = caname;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public int getbLevel() {
		return bLevel;
	}

	public void setbLevel(int bLevel) {
		this.bLevel = bLevel;
	}

	public int getTargetBno() {
		return targetBno;
	}

	public void setTargetBno(int targetBno) {
		this.targetBno = targetBno;
	}

	public String getIsOpen() {
		return isOpen;
	}

	public void setIsOpen(String isOpen) {
		this.isOpen = isOpen;
	}

	public int getNeedPoint() {
		return needPoint;
	}

	public void setNeedPoint(int needPoint) {
		this.needPoint = needPoint;
	}

	public int getComments() {
		return comments;
	}

	public void setComments(int comments) {
		this.comments = comments;
	}

	public String getNmTitle() {
		return nmTitle;
	}

	public void setNmTitle(String nmTitle) {
		this.nmTitle = nmTitle;
	}

	@Override
	public String toString() {
		return "Board [bno=" + bno + ", bTno=" + bTno + ", bType=" + bType + ", profileName=" + profileName
				+ ", bTitle=" + bTitle + ", bContent=" + bContent + ", bHidden=" + bHidden + ", mno=" + mno
				+ ", bWriter=" + bWriter + ", createDate=" + createDate + ", modifyDate=" + modifyDate + ", status="
				+ status + ", nmno=" + nmno + ", cano=" + cano + ", caname=" + caname + ", cno=" + cno + ", bLevel="
				+ bLevel + ", targetBno=" + targetBno + ", isOpen=" + isOpen + ", needPoint=" + needPoint
				+ ", comments=" + comments + ", nmTitle=" + nmTitle + "]";
	}

	
}

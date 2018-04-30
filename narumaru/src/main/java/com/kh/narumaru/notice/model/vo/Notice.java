package com.kh.narumaru.notice.model.vo;

import java.sql.Date;

public class Notice implements java.io.Serializable{
	private int nid;
	private int noType;
	private String noTitle;
	private String noContent;
	private int writerId;
	private Date createDate;
	private Date modifyDate;
	private String status;
	
	
	
	public Notice(){
		super();
	}


	
	
	public Notice(int nid, int noType, String noTitle, String noContent, int writerId, Date createDate, Date modifyDate,
			String status) {
		super();
		this.nid = nid;
		this.noType = noType;
		this.noTitle = noTitle;
		this.noContent = noContent;
		this.writerId = writerId;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}




	public int getnid() {
		return nid;
	}



	public void setnid(int nid) {
		this.nid = nid;
	}



	public int getNoType() {
		return noType;
	}



	public void setNoType(int noType) {
		this.noType = noType;
	}



	public String getNoTitle() {
		return noTitle;
	}



	public void setNoTitle(String noTitle) {
		this.noTitle = noTitle;
	}



	public String getNoContent() {
		return noContent;
	}



	public void setNoContent(String noContent) {
		this.noContent = noContent;
	}



	public int getWriterId() {
		return writerId;
	}



	public void setWriterId(int writerId) {
		this.writerId = writerId;
	}



	public Date getCreateDate() {
		return createDate;
	}



	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	public Date getModifyDate() {
		return modifyDate;
	}




	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}




	@Override
	public String toString() {
		return "Notice [nid=" + nid + ", noType=" + noType + ", noTitle=" + noTitle + ", noContent=" + noContent
				+ ", writerId=" + writerId + ", createDate=" + createDate + ", modifyDate=" + modifyDate + ", status="
				+ status + "]";
	}




	
	



}

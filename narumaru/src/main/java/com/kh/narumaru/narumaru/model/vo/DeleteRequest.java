package com.kh.narumaru.narumaru.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class DeleteRequest implements java.io.Serializable{
	private int delno;
	private int nmno;
	private Date deleteDate;
	private String deleteIu;
	
	public DeleteRequest(){}

	public DeleteRequest(int delno, int nmno, Date deleteDate, String deleteIu) {
		this.delno = delno;
		this.nmno = nmno;
		this.deleteDate = deleteDate;
		this.deleteIu = deleteIu;
	}

	public int getDelno() {
		return delno;
	}

	public void setDelno(int delno) {
		this.delno = delno;
	}

	public int getNmno() {
		return nmno;
	}

	public void setNmno(int nmno) {
		this.nmno = nmno;
	}

	public Date getDeleteDate() {
		return deleteDate;
	}

	public void setDeleteDate(Date deleteDate) {
		this.deleteDate = deleteDate;
	}

	public String getDeleteIu() {
		return deleteIu;
	}

	public void setDeleteIu(String deleteIu) {
		this.deleteIu = deleteIu;
	}

	@Override
	public String toString() {
		return "DeleteRequest [delno=" + delno + ", nmno=" + nmno + ", deleteDate=" + deleteDate + ", deleteIu="
				+ deleteIu + "]";
	}
	
	
}

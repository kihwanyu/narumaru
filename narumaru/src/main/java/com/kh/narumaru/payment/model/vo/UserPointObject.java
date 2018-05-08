package com.kh.narumaru.payment.model.vo;

import java.io.Serializable;
import java.util.ArrayList;

import org.springframework.stereotype.Component;

import com.kh.narumaru.common.model.vo.PageInfo;
@Component
public class UserPointObject implements Serializable{
	private ArrayList<UsePoint> uList;
	private PageInfo pi;
	private int userPointTotal;
	public UserPointObject() {
		super();
	}
	
	public UserPointObject(ArrayList<UsePoint> uList, PageInfo pi, int userPointTotal) {
		super();
		this.uList = uList;
		this.pi = pi;
		this.userPointTotal = userPointTotal;
	}
	

	public UserPointObject(ArrayList<UsePoint> uList, PageInfo pi) {
		super();
		this.uList = uList;
		this.pi = pi;
	}

	public ArrayList<UsePoint> getuList() {
		return uList;
	}
	public void setuList(ArrayList<UsePoint> uList) {
		this.uList = uList;
	}
	public PageInfo getPi() {
		return pi;
	}
	public void setPi(PageInfo pi) {
		this.pi = pi;
	}
	public int getUserPointTotal() {
		return userPointTotal;
	}
	public void setUserPointTotal(int userPointTotal) {
		this.userPointTotal = userPointTotal;
	}
	@Override
	public String toString() {
		return "UserPointObject [uList=" + uList + ", pi=" + pi + ", userPointTotal=" + userPointTotal + "]";
	}
	
}

package com.kh.narumaru.payment.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class Bank implements Serializable{
	private String bcode;
	private String bank_name;
	
	
	public Bank() {
		super();
	}


	public Bank(String bcode, String bank_name) {
		super();
		this.bcode = bcode;
		this.bank_name = bank_name;
	}


	public String getBcode() {
		return bcode;
	}


	public void setBcode(String bcode) {
		this.bcode = bcode;
	}


	public String getBank_name() {
		return bank_name;
	}


	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}


	@Override
	public String toString() {
		return "Bank [bcode=" + bcode + ", bank_name=" + bank_name + "]";
	}
	
	
}

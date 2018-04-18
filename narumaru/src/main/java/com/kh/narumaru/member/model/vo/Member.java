package com.kh.narumaru.member.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Member implements java.io.Serializable{
	
	private int mid;
	private String email;
	private String userPwd;
	private String nickName;
	private String profileName;
	private String gender;
	private Date birthDay;
	private String phone;
	private Date enroll_date;
	private Date modify_date;
	private String status;
	
	public Member(){}

	public Member(int mid, String email, String userPwd, String nickName, String profileName, String gender,
			Date birthDay, String phone, Date enroll_date, Date modify_date, String status) {
		super();
		this.mid = mid;
		this.email = email;
		this.userPwd = userPwd;
		this.nickName = nickName;
		this.profileName = profileName;
		this.gender = gender;
		this.birthDay = birthDay;
		this.phone = phone;
		this.enroll_date = enroll_date;
		this.modify_date = modify_date;
		this.status = status;
	}

	public int getMid() {
		return mid;
	}

	public void setMid(int mid) {
		this.mid = mid;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getProfileName() {
		return profileName;
	}

	public void setProfileName(String profileName) {
		this.profileName = profileName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getBirthDay() {
		return birthDay;
	}

	public void setBirthDay(Date birthDay) {
		this.birthDay = birthDay;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getEnroll_date() {
		return enroll_date;
	}

	public void setEnroll_date(Date enroll_date) {
		this.enroll_date = enroll_date;
	}

	public Date getModify_date() {
		return modify_date;
	}

	public void setModify_date(Date modify_date) {
		this.modify_date = modify_date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Member [mid=" + mid + ", email=" + email + ", userPwd=" + userPwd + ", nickName=" + nickName
				+ ", profileName=" + profileName + ", gender=" + gender + ", birthDay=" + birthDay + ", phone=" + phone
				+ ", enroll_date=" + enroll_date + ", modify_date=" + modify_date + ", status=" + status + "]";
	}

	
	
}

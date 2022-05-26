package com.kh.member.model.vo;

import java.sql.Date;

public class MemberUser {
	private int userNo;
	private String userId;
	private String userPw;
	private String userName;
	private String userNName;
	private Date userBirth;
	private String gender;
	private String email;
	private String phone;
	private String address;
	private Date enterdate;
	private String u_status;
	private int userRPC;
	private Date banDate;
	public MemberUser() {
		super();
	}
	public MemberUser(int userNo, String userId, String userPw, String userName, String userNName, Date userBirth,
			String gender, String email, String phone, String address, Date enterdate, String u_status, int userRPC,
			Date banDate) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userNName = userNName;
		this.userBirth = userBirth;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.enterdate = enterdate;
		this.u_status = u_status;
		this.userRPC = userRPC;
		this.banDate = banDate;
	}
	
	public MemberUser(int userNo, String userNName, String u_status, Date banDate) {
		super();
		this.userNo = userNo;
		this.userNName = userNName;
		this.u_status = u_status;
		this.banDate = banDate;
	}
	
	public MemberUser(int userNo, String userId, String userPw, String userName, String userNName, Date userBirth,
			String gender, String email, String phone, String address, Date enterdate, String u_status, int userRPC) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userNName = userNName;
		this.userBirth = userBirth;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.enterdate = enterdate;
		this.u_status = u_status;
		this.userRPC = userRPC;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserNName() {
		return userNName;
	}
	public void setUserNName(String userNName) {
		this.userNName = userNName;
	}
	public Date getUserBirth() {
		return userBirth;
	}
	public void setUserBirth(Date userBirth) {
		this.userBirth = userBirth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getEnterdate() {
		return enterdate;
	}
	public void setEnterdate(Date enterdate) {
		this.enterdate = enterdate;
	}
	public String getU_status() {
		return u_status;
	}
	public void setU_status(String u_status) {
		this.u_status = u_status;
	}
	public int getUserRPC() {
		return userRPC;
	}
	public void setUserRPC(int userRPC) {
		this.userRPC = userRPC;
	}
	public Date getBanDate() {
		return banDate;
	}
	public void setBanDate(Date banDate) {
		this.banDate = banDate;
	}
	@Override
	public String toString() {
		return "MemberUser [userNo=" + userNo + ", userId=" + userId + ", userPw=" + userPw + ", userName=" + userName
				+ ", userNName=" + userNName + ", userBirth=" + userBirth + ", gender=" + gender + ", email=" + email
				+ ", phone=" + phone + ", address=" + address + ", enterdate=" + enterdate + ", u_status=" + u_status
				+ ", userRPC=" + userRPC + ", banDate=" + banDate + "]";
	}
	
	
}

package com.kh.modle.vo;

public class Member {
	
	private int memberNo;
	private String name;
	private int age;
	private String gender;
	
	public Member() {
		super();
	}

	public Member(int memberNo, String name, int age, String gender) {
		super();
		this.memberNo = memberNo;
		this.name = name;
		this.age = age;
		this.gender = gender;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", name=" + name + ", age=" + age + ", gender=" + gender + "]";
	}
	
	
}

package com.spring.mr.vo.cs;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;


@JsonIgnoreProperties(value = {"searchCondition", "searchKeyword"})
public class QuestionVO {
	
	private int qIdx;
	private String name;
	private String memberid;
	private String phone;
	private String email;
	private String anyTyp;
	private String qTitle;
	private String qContent;
	private String qRegdate;
	private String qYn;
	private String aContent;
	
	
	private String searchCondition;
	private String searchKeyword;
	
	
	private int qIdx2;
	private String aRegdate;
	
	public int getqIdx() {
		return qIdx;
	}
	public void setqIdx(int qIdx) {
		this.qIdx = qIdx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAnyTyp() {
		return anyTyp;
	}
	public void setAnyTyp(String anyTyp) {
		this.anyTyp = anyTyp;
	}
	public String getqTitle() {
		return qTitle;
	}
	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}
	public String getqContent() {
		return qContent;
	}
	public void setqContent(String qContent) {
		this.qContent = qContent;
	}
	public String getqRegdate() {
		return qRegdate;
	}
	public void setqRegdate(String qRegdate) {
		this.qRegdate = qRegdate;
	}
	public String getqYn() {
		return qYn;
	}
	public void setqYn(String qYn) {
		this.qYn = qYn;
	}
	public String getaContent() {
		return aContent;
	}
	public void setaContent(String aContent) {
		this.aContent = aContent;
	}
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	
	
	
	
	public int getqIdx2() {
		return qIdx2;
	}
	public void setqIdx2(int qIdx2) {
		this.qIdx2 = qIdx2;
	}
	public String getaRegdate() {
		return aRegdate;
	}
	public void setaRegdate(String aRegdate) {
		this.aRegdate = aRegdate;
	}
	@Override
	public String toString() {
		return "QuestionVO [qIdx=" + qIdx + ", name=" + name + ", memberid=" + memberid + ", phone=" + phone
				+ ", email=" + email + ", anyTyp=" + anyTyp + ", qTitle=" + qTitle + ", qContent=" + qContent
				+ ", qRegdate=" + qRegdate + ", qYn=" + qYn + ", aContent=" + aContent + ", searchCondition="
				+ searchCondition + ", searchKeyword=" + searchKeyword + ", qIdx2=" + qIdx2 + ", aRegdate=" + aRegdate
				+ "]";
	}


	
	

}

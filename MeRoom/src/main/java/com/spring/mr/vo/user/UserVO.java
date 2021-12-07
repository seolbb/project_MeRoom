package com.spring.mr.vo.user;

public class UserVO {
	private String memberId;
	private String password;
	private String name;
	private String nickname;
	private String birth;
	private String phone;
	private String address;
	private String email;
	private String joinDate;
	private String wthdrDate;
	
	   private String searchCondition;
	   private String searchKeyword;
	   private String beginDate;
	   private String endDate;
	
	
	public UserVO() {
		
	}
	

	
	

	public UserVO(String memberId, String password, String name, String nickname, String birth, String phone,
			String address, String email) {
		super();
		this.memberId = memberId;
		this.password = password;
		this.name = name;
		this.nickname = nickname;
		this.birth = birth;
		this.phone = phone;
		this.address = address;
		this.email = email;
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





	public String getBeginDate() {
		return beginDate;
	}





	public void setBeginDate(String beginDate) {
		this.beginDate = beginDate;
	}





	public String getEndDate() {
		return endDate;
	}





	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}





	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}



	public String getJoinDate() {
		return joinDate;
	}



	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}



	public String getWthdrDate() {
		return wthdrDate;
	}



	public void setWthdrDate(String wthdrDate) {
		this.wthdrDate = wthdrDate;
	}



	@Override
	public String toString() {
		return "UserVO [memberId=" + memberId + ", password=" + password + ", name=" + name + ", nickname=" + nickname
				+ ", birth=" + birth + ", phone=" + phone + ", address=" + address + ", email=" + email + ", joinDate="
				+ joinDate + ", wthdrDate=" + wthdrDate + "]";
	}
	
	


	
	
	
}
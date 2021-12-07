package com.spring.mr.vo.reservation;

public class ReservationVO {
	private String rIdx;
	private int rmNumber;
	private String memberId;
	private String aplctDate;
	private String startDate;
	private String endDate;
	private String area;
	
	
	private int count;
	private String rmKind;
	private int score;
	private String rvContent;
	private String nickName;
	private String rvDate;
	
	public ReservationVO() {}
	
	
	public ReservationVO(String rIdx, int rmNumber, String memberId, String aplctDate, String startDate, String endDate,
			String area) {
		super();
		this.rIdx = rIdx;
		this.rmNumber = rmNumber;
		this.memberId = memberId;
		this.aplctDate = aplctDate;
		this.startDate = startDate;
		this.endDate = endDate;
		this.area = area;
	}
	
	
	public String getrIdx() {
		return rIdx;
	}
	public void setrIdx(String rIdx) {
		this.rIdx = rIdx;
	}
	public int getRmNumber() {
		return rmNumber;
	}
	public void setRmNumber(int rmNumber) {
		this.rmNumber = rmNumber;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getAplctDate() {
		return aplctDate;
	}
	public void setAplctDate(String aplctDate) {
		this.aplctDate = aplctDate;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}

	public String getRvDate() {
		return rvDate;
	}
	public void setRvDate(String rvDate) {
		this.rvDate = rvDate;
	}

	public String getRmKind() {
		return rmKind;
	}

	public void setRmKind(String rmKind) {
		this.rmKind = rmKind;
	}

	

	public int getScore() {
		return score;
	}


	public void setScore(int score) {
		this.score = score;
	}


	public String getRvContent() {
		return rvContent;
	}


	public void setRvContent(String rvContent) {
		this.rvContent = rvContent;
	}

	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}


	@Override
	public String toString() {
		return "ReservationVO [rIdx=" + rIdx + ", rmNumber=" + rmNumber + ", memberId=" + memberId + ", aplctDate="
				+ aplctDate + ", startDate=" + startDate + ", endDate=" + endDate + ", area=" + area + ", count="
				+ count + ", rmKind=" + rmKind + ", score=" + score + ", rvContent=" + rvContent + "]";
	}


	
	
	
}

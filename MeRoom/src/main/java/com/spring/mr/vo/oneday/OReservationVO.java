package com.spring.mr.vo.oneday;

public class OReservationVO {
	private String orIdx;
	private int oIdx;
	private String memberid;
	private String orDate;
	private String orTime;
	private int orCount;
	
	
	private String mName;
	private String oName;
	private String oLocation;
	private String oPrice;
	private String oCategory;
	private String oImg;
	private String oInfo;
	
	
	public OReservationVO() {}

	public OReservationVO(String orIdx, int oIdx, String memberid, String orDate, String orTime, int orCount) {
		super();
		this.orIdx = orIdx;
		this.oIdx = oIdx;
		this.memberid = memberid;
		this.orDate = orDate;
		this.orTime = orTime;
		this.orCount = orCount;
	}
	
	
	

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getoName() {
		return oName;
	}

	public void setoName(String oName) {
		this.oName = oName;
	}

	public String getoLocation() {
		return oLocation;
	}

	public void setoLocation(String oLocation) {
		this.oLocation = oLocation;
	}

	public String getoPrice() {
		return oPrice;
	}

	public void setoPrice(String oPrice) {
		this.oPrice = oPrice;
	}

	public String getoCategory() {
		return oCategory;
	}

	public void setoCategory(String oCategory) {
		this.oCategory = oCategory;
	}

	public String getoImg() {
		return oImg;
	}

	public void setoImg(String oImg) {
		this.oImg = oImg;
	}

	public String getoInfo() {
		return oInfo;
	}

	public void setoInfo(String oInfo) {
		this.oInfo = oInfo;
	}

	public String getOrIdx() {
		return orIdx;
	}

	public void setOrIdx(String orIdx) {
		this.orIdx = orIdx;
	}

	public int getoIdx() {
		return oIdx;
	}

	public void setoIdx(int oIdx) {
		this.oIdx = oIdx;
	}

	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public String getOrDate() {
		return orDate;
	}

	public void setOrDate(String orDate) {
		this.orDate = orDate;
	}

	public String getOrTime() {
		return orTime;
	}

	public void setOrTime(String orTime) {
		this.orTime = orTime;
	}

	public int getOrCount() {
		return orCount;
	}

	public void setOrCount(int orCount) {
		this.orCount = orCount;
	}

	@Override
	public String toString() {
		return "OReservationVO [orIdx=" + orIdx + ", oIdx=" + oIdx + ", memberid=" + memberid + ", orDate=" + orDate
				+ ", orTime=" + orTime + ", orCount=" + orCount + "]";
	}
	
	

	
}

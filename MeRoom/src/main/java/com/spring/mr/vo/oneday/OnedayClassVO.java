package com.spring.mr.vo.oneday;

public class OnedayClassVO {
	private int oIdx;
	private String oCategory;
	private String oName;
	private String oDate;
	private String oTime;
	private String oLocation;
	private int oPrice;
	private int oCnt;
	private String oInfo;
	private String oImg;
	
	public OnedayClassVO() {}

	public OnedayClassVO(int oIdx, String oCategory, String oName, String oDate, String oTime, String oLocation,
			int oPrice, int oCnt, String oInfo, String oImg) {
		super();
		this.oIdx = oIdx;
		this.oCategory = oCategory;
		this.oName = oName;
		this.oDate = oDate;
		this.oTime = oTime;
		this.oLocation = oLocation;
		this.oPrice = oPrice;
		this.oCnt = oCnt;
		this.oInfo = oInfo;
		this.oImg = oImg;
	}

	public int getoIdx() {
		return oIdx;
	}

	public void setoIdx(int oIdx) {
		this.oIdx = oIdx;
	}

	public String getoCategory() {
		return oCategory;
	}

	public void setoCategory(String oCategory) {
		this.oCategory = oCategory;
	}

	public String getoName() {
		return oName;
	}

	public void setoName(String oName) {
		this.oName = oName;
	}

	public String getoDate() {
		return oDate;
	}

	public void setoDate(String oDate) {
		this.oDate = oDate;
	}

	public String getoTime() {
		return oTime;
	}

	public void setoTime(String oTime) {
		this.oTime = oTime;
	}

	public String getoLocation() {
		return oLocation;
	}

	public void setoLocation(String oLocation) {
		this.oLocation = oLocation;
	}

	public int getoPrice() {
		return oPrice;
	}

	public void setoPrice(int oPrice) {
		this.oPrice = oPrice;
	}

	public int getoCnt() {
		return oCnt;
	}

	public void setoCnt(int oCnt) {
		this.oCnt = oCnt;
	}

	public String getoInfo() {
		return oInfo;
	}

	public void setoInfo(String oInfo) {
		this.oInfo = oInfo;
	}

	public String getoImg() {
		return oImg;
	}

	public void setoImg(String oImg) {
		this.oImg = oImg;
	}

	@Override
	public String toString() {
		return "OnedayClassVO [oIdx=" + oIdx + ", oCategory=" + oCategory + ", oName=" + oName + ", oDate=" + oDate
				+ ", oTime=" + oTime + ", oLocation=" + oLocation + ", oPrice=" + oPrice + ", oCnt=" + oCnt + ", oInfo="
				+ oInfo + ", oImg=" + oImg + "]";
	}

	
}
	
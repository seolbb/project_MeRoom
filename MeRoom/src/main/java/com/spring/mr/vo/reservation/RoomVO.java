package com.spring.mr.vo.reservation;

public class RoomVO {
	private int rmNumber;
	private String rmKind;
	private String rmArea;
	private String rmInfo;
	private String rmPrice;
	private String fileName;
	
	private String startDate;
	private String endDate;
	private int count;
	
	public RoomVO() { }
	
	
	



	public RoomVO(int rmNumber, String rmKind, String rmArea, String rmInfo, String rmPrice, String fileName) {
		super();
		this.rmNumber = rmNumber;
		this.rmKind = rmKind;
		this.rmArea = rmArea;
		this.rmInfo = rmInfo;
		this.rmPrice = rmPrice;
		this.fileName = fileName;
	}





	public int getRmNumber() {
		return rmNumber;
	}

	public void setRmNumber(int rmNumber) {
		this.rmNumber = rmNumber;
	}


	public String getRmKind() {
		return rmKind;
	}
	public void setRmKind(String rmKind) {
		this.rmKind = rmKind;
	}
	public String getRmArea() {
		return rmArea;
	}
	public void setRmArea(String rmArea) {
		this.rmArea = rmArea;
	}
	public String getRmInfo() {
		return rmInfo;
	}
	public void setRmInfo(String rmInfo) {
		this.rmInfo = rmInfo;
	}
	
	public String getRmPrice() {
		return rmPrice;
	}
	public void setRmPrice(String rmPrice) {
		this.rmPrice = rmPrice;
	}

	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
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


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}



	@Override
	public String toString() {
		return "RoomVO [rmNumber=" + rmNumber + ", rmKind=" + rmKind + ", rmArea=" + rmArea + ", rmInfo=" + rmInfo
				+ ", rmPrice=" + rmPrice + ", fileName=" + fileName + ", startDate=" + startDate + ", endDate="
				+ endDate + ", count=" + count + "]";
	}
	
}

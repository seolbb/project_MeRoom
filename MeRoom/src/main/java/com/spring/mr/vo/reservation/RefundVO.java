package com.spring.mr.vo.reservation;

public class RefundVO {
	private int rfIdx;
	private String rIdx;
	private String rfInfo;
	private int rfMoney;
	private String rfCancle;
	
	
	public RefundVO() {
		
	}
	
	
	public RefundVO(int rfIdx, String rIdx, String rfInfo, int rfMoney, String rfCancle) {
		super();
		this.rfIdx = rfIdx;
		this.rIdx = rIdx;
		this.rfInfo = rfInfo;
		this.rfMoney = rfMoney;
		this.rfCancle = rfCancle;
	}
	
	public int getRfIdx() {
		return rfIdx;
	}
	public void setRfIdx(int rfIdx) {
		this.rfIdx = rfIdx;
	}
	public String getrIdx() {
		return rIdx;
	}
	public void setrIdx(String rIdx) {
		this.rIdx = rIdx;
	}
	public String getRfInfo() {
		return rfInfo;
	}
	public void setRfInfo(String rfInfo) {
		this.rfInfo = rfInfo;
	}
	public int getRfMoney() {
		return rfMoney;
	}
	public void setRfMoney(int rfMoney) {
		this.rfMoney = rfMoney;
	}
	public String getRfCancle() {
		return rfCancle;
	}
	public void setRfCancle(String rfCancle) {
		this.rfCancle = rfCancle;
	}

	
	@Override
	public String toString() {
		return "RefundVO [rfIdx=" + rfIdx + ", rIdx=" + rIdx + ", rfInfo=" + rfInfo + ", rfMoney=" + rfMoney
				+ ", rfCancle=" + rfCancle + "]";
	}
	
	
	

	
	
	
}

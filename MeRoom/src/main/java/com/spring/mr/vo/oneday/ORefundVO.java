package com.spring.mr.vo.oneday;

public class ORefundVO {
	private int orfIdx;
	private String orIdx;
	private int orfMoney;
	private String orfDate;
	
	public ORefundVO() {}

	public ORefundVO(int orfIdx, String orIdx, int orfMoney, String orfDate) {
		super();
		this.orfIdx = orfIdx;
		this.orIdx = orIdx;
		this.orfMoney = orfMoney;
		this.orfDate = orfDate;
	}

	public int getOrfIdx() {
		return orfIdx;
	}

	public void setOrfIdx(int orfIdx) {
		this.orfIdx = orfIdx;
	}

	public String getOrIdx() {
		return orIdx;
	}

	public void setOrIdx(String orIdx) {
		this.orIdx = orIdx;
	}

	public int getOrfMoney() {
		return orfMoney;
	}

	public void setOrfMoney(int orfMoney) {
		this.orfMoney = orfMoney;
	}

	public String getOrfDate() {
		return orfDate;
	}

	public void setOrfDate(String orfDate) {
		this.orfDate = orfDate;
	}

	@Override
	public String toString() {
		return "ORefundVO [orfIdx=" + orfIdx + ", orIdx=" + orIdx + ", orfMoney=" + orfMoney + ", orfDate=" + orfDate
				+ "]";
	}
	
}

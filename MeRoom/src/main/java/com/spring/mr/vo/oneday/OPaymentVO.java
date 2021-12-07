package com.spring.mr.vo.oneday;

import java.sql.Date;

public class OPaymentVO {
	private String opIdx;
	private String orIdx;
	private int opMoney;
	private Date opDate;
	private String opMethod;
	private int opPoint;
	
	public OPaymentVO() {}

	public OPaymentVO(String opIdx, String orIdx, int opMoney, Date opDate, String opMethod, int opPoint) {
		super();
		this.opIdx = opIdx;
		this.orIdx = orIdx;
		this.opMoney = opMoney;
		this.opDate = opDate;
		this.opMethod = opMethod;
		this.opPoint = opPoint;
	}

	public String getOpIdx() {
		return opIdx;
	}

	public void setOpIdx(String opIdx) {
		this.opIdx = opIdx;
	}

	public String getOrIdx() {
		return orIdx;
	}

	public void setOrIdx(String orIdx) {
		this.orIdx = orIdx;
	}

	public int getOpMoney() {
		return opMoney;
	}

	public void setOpMoney(int opMoney) {
		this.opMoney = opMoney;
	}

	public Date getOpDate() {
		return opDate;
	}

	public void setOpDate(Date opDate) {
		this.opDate = opDate;
	}

	public String getOpMethod() {
		return opMethod;
	}

	public void setOpMethod(String opMethod) {
		this.opMethod = opMethod;
	}

	public int getOpPoint() {
		return opPoint;
	}

	public void setOpPoint(int opPoint) {
		this.opPoint = opPoint;
	}

	@Override
	public String toString() {
		return "OPaymentVO [opIdx=" + opIdx + ", orIdx=" + orIdx + ", opMoney=" + opMoney + ", opDate=" + opDate
				+ ", opMethod=" + opMethod + ", opPoint=" + opPoint + "]";
	}
	
	
	
	
	

	
	
}
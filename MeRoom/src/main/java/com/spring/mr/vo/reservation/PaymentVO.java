package com.spring.mr.vo.reservation;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class PaymentVO {
	private String payIdx;
	private String rIdx;
	private int price;
	@JsonFormat(shape =JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date payDate;
	private String payMns;
	
	private String category;
	private int point;
	
	public PaymentVO() {}


	
	
	public PaymentVO(String payIdx, String rIdx, int price, Date payDate, String payMns) {
		super();
		this.payIdx = payIdx;
		this.rIdx = rIdx;
		this.price = price;
		this.payDate = payDate;
		this.payMns = payMns;
	}




	public String getPayIdx() {
		return payIdx;
	}


	public void setPayIdx(String payIdx) {
		this.payIdx = payIdx;
	}


	public String getrIdx() {
		return rIdx;
	}


	public void setrIdx(String rIdx) {
		this.rIdx = rIdx;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public Date getPayDate() {
		return payDate;
	}


	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}


	public String getPayMns() {
		return payMns;
	}


	public void setPayMns(String payMns) {
		this.payMns = payMns;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}



	@Override
	public String toString() {
		return "PaymentVO [payIdx=" + payIdx + ", rIdx=" + rIdx + ", price=" + price + ", payDate=" + payDate
				+ ", payMns=" + payMns + "]";
	}
	
	
	

	
	
}

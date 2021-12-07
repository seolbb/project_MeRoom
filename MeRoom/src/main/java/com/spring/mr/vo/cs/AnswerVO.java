package com.spring.mr.vo.cs;

import java.sql.Date;


public class AnswerVO {

	
	private int aIdx;
	private int qIdx2;
	private String aContent;
	private Date aRegdate;
	private String aYn;
	
	
	
	public int getaIdx() {
		return aIdx;
	}
	public void setaIdx(int aIdx) {
		this.aIdx = aIdx;
	}
	public int getqIdx2() {
		return qIdx2;
	}
	public void setqIdx2(int qIdx2) {
		this.qIdx2 = qIdx2;
	}
	public String getaContent() {
		return aContent;
	}
	public void setaContent(String aContent) {
		this.aContent = aContent;
	}
	public Date getaRegdate() {
		return aRegdate;
	}
	public void setaRegdate(Date aRegdate) {
		this.aRegdate = aRegdate;
	}
	public String getaYn() {
		return aYn;
	}
	public void setaYn(String aYn) {
		this.aYn = aYn;
	}
	
	
	@Override
	public String toString() {
		return "AnswerVO [aIdx=" + aIdx + ", qIdx2=" + qIdx2 + ", aContent=" + aContent + ", aRegdate=" + aRegdate
				+ ", aYn=" + aYn + "]";
	}
	
	
	
	
	
	
	
	
}

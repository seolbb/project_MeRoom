package com.spring.mr.vo.cs;

import java.sql.Date;



public class EventVO {
	
	private int evIdx;
	private String evTitle;
	private String evSubtitle;
	private String evContent;
	private String evThumbnail;
	private Date evRegdate;
	
	
	public int getEvIdx() {
		return evIdx;
	}
	public void setEvIdx(int evIdx) {
		this.evIdx = evIdx;
	}
	public String getEvTitle() {
		return evTitle;
	}
	public void setEvTitle(String evTitle) {
		this.evTitle = evTitle;
	}
	public String getEvSubtitle() {
		return evSubtitle;
	}
	public void setEvSubtitle(String evSubtitle) {
		this.evSubtitle = evSubtitle;
	}
	public String getEvContent() {
		return evContent;
	}
	public void setEvContent(String evContent) {
		this.evContent = evContent;
	}
	public String getEvThumbnail() {
		return evThumbnail;
	}
	public void setEvThumbnail(String evThumbnail) {
		this.evThumbnail = evThumbnail;
	}
	public Date getEvRegdate() {
		return evRegdate;
	}
	public void setEvRegdate(Date evRegdate) {
		this.evRegdate = evRegdate;
	}
	
	
	@Override
	public String toString() {
		return "EventVO [evIdx=" + evIdx + ", evTitle=" + evTitle + ", evSubtitle=" + evSubtitle + ", evContent="
				+ evContent + ", evThumbnail=" + evThumbnail + ", evRegdate=" + evRegdate + "]";
	}
	
	
	
	
	
	

}

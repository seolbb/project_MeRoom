package com.spring.mr.vo.cs;

import java.sql.Date;


public class PromotionVO {
	
	private int prIdx;
	private String prTitle;
	private String prSubtitle;
	private String prContent;
	private String prThumbnail;
	private Date prRegdate;
	
	
	
	public int getPrIdx() {
		return prIdx;
	}
	public void setPrIdx(int prIdx) {
		this.prIdx = prIdx;
	}
	public String getPrTitle() {
		return prTitle;
	}
	public void setPrTitle(String prTitle) {
		this.prTitle = prTitle;
	}
	public String getPrSubtitle() {
		return prSubtitle;
	}
	public void setPrSubtitle(String prSubtitle) {
		this.prSubtitle = prSubtitle;
	}
	public String getPrContent() {
		return prContent;
	}
	public void setPrContent(String prContent) {
		this.prContent = prContent;
	}
	public String getPrThumbnail() {
		return prThumbnail;
	}
	public void setPrThumbnail(String prThumbnail) {
		this.prThumbnail = prThumbnail;
	}
	public Date getPrRegdate() {
		return prRegdate;
	}
	public void setPrRegdate(Date prRegdate) {
		this.prRegdate = prRegdate;
	}
	
	
	@Override
	public String toString() {
		return "PromotionVO [prIdx=" + prIdx + ", prTitle=" + prTitle + ", prSubtitle=" + prSubtitle + ", prContent="
				+ prContent + ", prThumbnail=" + prThumbnail + ", prRegdate=" + prRegdate + "]";
	}
	
	
	
	

}

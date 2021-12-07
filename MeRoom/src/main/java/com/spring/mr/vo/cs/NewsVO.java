package com.spring.mr.vo.cs;

import java.sql.Date;




public class NewsVO {
	private int neIdx;
	private String neTitle;
	private String neSubtitle;
	private String neContent;
	private String neThumbnail;
	private Date neRegdate;
	
	
	
	public int getNeIdx() {
		return neIdx;
	}
	public void setNeIdx(int neIdx) {
		this.neIdx = neIdx;
	}
	public String getNeTitle() {
		return neTitle;
	}
	public void setNeTitle(String neTitle) {
		this.neTitle = neTitle;
	}
	public String getNeSubtitle() {
		return neSubtitle;
	}
	public void setNeSubtitle(String neSubtitle) {
		this.neSubtitle = neSubtitle;
	}
	public String getNeContent() {
		return neContent;
	}
	public void setNeContent(String neContent) {
		this.neContent = neContent;
	}
	public String getNeThumbnail() {
		return neThumbnail;
	}
	public void setNeThumbnail(String neThumbnail) {
		this.neThumbnail = neThumbnail;
	}
	public Date getNeRegdate() {
		return neRegdate;
	}
	public void setNeRegdate(Date neRegdate) {
		this.neRegdate = neRegdate;
	}
	
	
	@Override
	public String toString() {
		return "NewsVO [neIdx=" + neIdx + ", neTitle=" + neTitle + ", neSubtitle=" + neSubtitle + ", neContent="
				+ neContent + ", neThumbnail=" + neThumbnail + ", neRegdate=" + neRegdate + "]";
	}
	
	
	
	
	
	
	
	
	
}

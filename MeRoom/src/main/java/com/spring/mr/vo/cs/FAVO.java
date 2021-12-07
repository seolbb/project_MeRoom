package com.spring.mr.vo.cs;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(value = {"searchCondition", "searchKeyword"})
public class FAVO {
	
	private int fIdx;
	private String fTitle;
	private String fContent;
	
	private String searchCondition;
	private String searchKeyword;

	
	
	
	public FAVO() {
		System.out.println("FAVO 객체 생성 ");
	
	}


	public int getfIdx() {
		return fIdx;
	}


	public void setfIdx(int fIdx) {
		this.fIdx = fIdx;
	}


	public String getfTitle() {
		return fTitle;
	}


	public void setfTitle(String fTitle) {
		this.fTitle = fTitle;
	}


	public String getfContent() {
		return fContent;
	}


	public void setfContent(String fContent) {
		this.fContent = fContent;
	}


	
	public String getSearchCondition() {
		return searchCondition;
	}


	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}


	public String getSearchKeyword() {
		return searchKeyword;
	}


	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}


	

	@Override
	public String toString() {
		return "FAVO [fIdx=" + fIdx + ", fTitle=" + fTitle + ", fContent=" + fContent + ", searchCondition="
				+ searchCondition + ", searchKeyword=" + searchKeyword +  "]";
	}


	
	
	

}

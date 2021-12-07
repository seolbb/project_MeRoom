package com.spring.mr.vo.place;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class PlaceVO {
	private int pid; 
	private String ptitle; 
	private String ptime;
	private String pphone;
	private String plocation;
	private String pcontent;
	private String pfilepath;
	private String plat;
	private String plng;
	private String ptext;
	
//
//	
//	// 검색조건용 필드 추가
//		@JsonIgnore // JSON 데이터 변경 제외
//		private String searchCondition;
//		@JsonIgnore // JSON 데이터 변경 제외
//		private String searchKeyword;
//	
//	
	
	
	public PlaceVO() {
		System.out.println("PlaceVO() 객체 생성");
	}
	
	
	


	public PlaceVO(int pid, String ptitle, String ptime, String pphone, String plocation, String pcontent,
			String pfilepath, String plat, String plng, String ptext) {
		super();
		this.pid = pid;
		this.ptitle = ptitle;
		this.ptime = ptime;
		this.pphone = pphone;
		this.plocation = plocation;
		this.pcontent = pcontent;
		this.pfilepath = pfilepath;
		this.plat = plat;
		this.plng = plng;
		this.ptext = ptext;
	}





	public int getPid() {
		return pid;
	}


	public void setPid(int pid) {
		this.pid = pid;
	}


	public String getPtitle() {
		return ptitle;
	}


	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}


	public String getPtime() {
		return ptime;
	}


	public void setPtime(String ptime) {
		this.ptime = ptime;
	}


	public String getPphone() {
		return pphone;
	}


	public void setPphone(String pphone) {
		this.pphone = pphone;
	}


	public String getPlocation() {
		return plocation;
	}


	public void setPlocation(String plocation) {
		this.plocation = plocation;
	}


	public String getPcontent() {
		return pcontent;
	}


	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}


	public String getPfilepath() {
		return pfilepath;
	}


	public void setPfilepath(String pfilepath) {
		this.pfilepath = pfilepath;
	}


	public String getPlat() {
		return plat;
	}


	public void setPlat(String plat) {
		this.plat = plat;
	}


	public String getPlng() {
		return plng;
	}


	public void setPlng(String plng) {
		this.plng = plng;
	}


	public String getPtext() {
		return ptext;
	}


	public void setPtext(String ptext) {
		this.ptext = ptext;
	}




	@Override
	public String toString() {
		return "PlaceVO [pid=" + pid + ", ptitle=" + ptitle + ", ptime=" + ptime + ", pphone=" + pphone + ", plocation="
				+ plocation + ", pcontent=" + pcontent + ", pfilepath=" + pfilepath + ", plat=" + plat + ", plng="
				+ plng + ", ptext=" + ptext + "]";
	}

	

	//	----------------------------------------------------

//
//	public String getSearchCondition() {
//		return searchCondition;
//	}
//
//	public void setSearchCondition(String searchCondition) {
//		this.searchCondition = searchCondition;
//	}
//
//
//	public String getSearchKeyword() {
//		return searchKeyword;
//	}
//
//
//	public void setSearchKeyword(String searchKeyword) {
//		this.searchKeyword = searchKeyword;
//	}
//
//	
//	
//	
	
	
	
	
}
	
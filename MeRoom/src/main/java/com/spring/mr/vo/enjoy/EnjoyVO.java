package com.spring.mr.vo.enjoy;

public class EnjoyVO {
	private int eid;
	private String ecategory;
	private String etitle;
	private String etext;
	private String ephone;
	private String elocation;
	private String eprice;
	private String etime;
	private String einfo;
	private String efilepath;
	
	public EnjoyVO() {
		System.out.println(">> EnjoyVO() 객체 생성");
	}

	public EnjoyVO(int eid, String ecategory, String etitle, String etext, String ephone, String elocation,
			String eprice, String etime, String einfo, String efilepath) {
		super();
		this.eid = eid;
		this.ecategory = ecategory;
		this.etitle = etitle;
		this.etext = etext;
		this.ephone = ephone;
		this.elocation = elocation;
		this.eprice = eprice;
		this.etime = etime;
		this.einfo = einfo;
		this.efilepath = efilepath;
	}

	public int getEid() {
		return eid;
	}

	public void setEid(int eid) {
		this.eid = eid;
	}

	public String getEcategory() {
		return ecategory;
	}

	public void setEcategory(String ecategory) {
		this.ecategory = ecategory;
	}

	public String getEtitle() {
		return etitle;
	}

	public void setEtitle(String etitle) {
		this.etitle = etitle;
	}

	public String getEtext() {
		return etext;
	}

	public void setEtext(String etext) {
		this.etext = etext;
	}

	public String getEphone() {
		return ephone;
	}

	public void setEphone(String ephone) {
		this.ephone = ephone;
	}

	public String getElocation() {
		return elocation;
	}

	public void setElocation(String elocation) {
		this.elocation = elocation;
	}

	public String getEprice() {
		return eprice;
	}

	public void setEprice(String eprice) {
		this.eprice = eprice;
	}

	public String getEtime() {
		return etime;
	}

	public void setEtime(String etime) {
		this.etime = etime;
	}

	public String getEinfo() {
		return einfo;
	}

	public void setEinfo(String einfo) {
		this.einfo = einfo;
	}

	public String getEfilepath() {
		return efilepath;
	}

	public void setEfilepath(String efilepath) {
		this.efilepath = efilepath;
	}

	@Override
	public String toString() {
		return "EnjoyVO [eid=" + eid + ", ecategory=" + ecategory + ", etitle=" + etitle + ", etext=" + etext
				+ ", ephone=" + ephone + ", elocation=" + elocation + ", eprice=" + eprice + ", etime=" + etime
				+ ", einfo=" + einfo + ", efilepath=" + efilepath + "]";
	}

	
	
	
	
}

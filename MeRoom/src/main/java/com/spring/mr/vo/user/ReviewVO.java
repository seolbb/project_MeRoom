package com.spring.mr.vo.user;

public class ReviewVO {
	private int rv_idx;
	private String r_idx;
	private String memberId;
	private String rv_content;
	private String rv_date;
	private int score;
	private String rm_kind;
	private String r_start_date;
	private String r_end_date;
	
	
	public int getRv_idx() {
		return rv_idx;
	}
	public void setRv_idx(int rv_idx) {
		this.rv_idx = rv_idx;
	}
	public String getR_idx() {
		return r_idx;
	}
	public void setR_idx(String r_idx) {
		this.r_idx = r_idx;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getRv_content() {
		return rv_content;
	}
	public void setRv_content(String rv_content) {
		this.rv_content = rv_content;
	}
	public String getRv_date() {
		return rv_date;
	}
	public void setRv_date(String rv_date) {
		this.rv_date = rv_date;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getRm_kind() {
		return rm_kind;
	}
	public void setRm_kind(String rm_kind) {
		this.rm_kind = rm_kind;
	}
	public String getR_start_date() {
		return r_start_date;
	}
	public void setR_start_date(String r_start_date) {
		this.r_start_date = r_start_date;
	}
	public String getR_end_date() {
		return r_end_date;
	}
	public void setR_end_date(String r_end_date) {
		this.r_end_date = r_end_date;
	}
	@Override
	public String toString() {
		return "ReviewVO [rv_idx=" + rv_idx + ", r_idx=" + r_idx + ", memberId=" + memberId + ", rv_content="
				+ rv_content + ", rv_date=" + rv_date + ", score=" + score + ", rm_kind=" + rm_kind + ", r_start_date="
				+ r_start_date + ", r_end_date=" + r_end_date + "]";
	}
	

	
	
}

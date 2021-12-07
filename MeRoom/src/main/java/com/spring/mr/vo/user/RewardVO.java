package com.spring.mr.vo.user;

public class RewardVO {
	
	private int reward_idx;
	private String memberId;
	private String re_category;
	private int point;
	private String reward_date;
	
	
	
	public RewardVO() {
	}



	public int getReward_idx() {
		return reward_idx;
	}



	public void setReward_idx(int reward_idx) {
		this.reward_idx = reward_idx;
	}



	public String getMemberId() {
		return memberId;
	}



	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}



	public String getRe_category() {
		return re_category;
	}



	public void setRe_category(String re_category) {
		this.re_category = re_category;
	}



	public int getPoint() {
		return point;
	}



	public void setPoint(int point) {
		this.point = point;
	}



	public String getReward_date() {
		return reward_date;
	}



	public void setReward_date(String reward_date) {
		this.reward_date = reward_date;
	}



	@Override
	public String toString() {
		return "RewardVO [reward_idx=" + reward_idx + ", memberId=" + memberId + ", re_category=" + re_category
				+ ", point=" + point + ", reward_date=" + reward_date + "]";
	}

	
	
	
	
	

}

package com.spring.mr.vo.user;

public class AdminRewardVO {
	private String re_category;
	private int reward_per;
	private int reward_num;
	
		
	
	
	public String getRe_category() {
		return re_category;
	}




	public void setRe_category(String re_category) {
		this.re_category = re_category;
	}




	public int getReward_per() {
		return reward_per;
	}




	public void setReward_per(int reward_per) {
		this.reward_per = reward_per;
	}




	public int getReward_num() {
		return reward_num;
	}




	public void setReward_num(int reward_num) {
		this.reward_num = reward_num;
	}




	@Override
	public String toString() {
		return "AdminRewardVO [re_category=" + re_category + ", reward_per=" + reward_per + ", reward_num=" + reward_num
				+ "]";
	}
	
	
	
	
	
}

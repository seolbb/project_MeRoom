package com.spring.mr.service.user;

import java.util.List;

import com.spring.mr.vo.user.RewardVO;

public interface RewardService {
	
	int insertReward(RewardVO vo);
	int deleteReward(String reward_date);
	int totalReward(String memberId);
	List<RewardVO> getRewardList();
	List<RewardVO> getRewardList(String memberId);
	
}

package com.spring.mr.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mr.vo.user.RewardVO;

@Service("rewardService")
public class RewardServiceImpl implements RewardService{
	@Autowired
	private RewardDAO rewardDAO;
	
	public RewardServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public int insertReward(RewardVO vo) {
		return rewardDAO.insertReward(vo);
	}


	@Override
	public int deleteReward(String reward_date) {
		return rewardDAO.deleteDateRe(reward_date);
	}

	@Override
	public List<RewardVO> getRewardList() {
		return rewardDAO.allRewardList();
	}

	@Override
	public List<RewardVO> getRewardList(String memberId) {
		return rewardDAO.getRewardList(memberId);
	}

	@Override
	public int totalReward(String memberId) {
		return rewardDAO.totalReward(memberId);
	}


	
}

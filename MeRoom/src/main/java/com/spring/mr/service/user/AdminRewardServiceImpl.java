package com.spring.mr.service.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mr.vo.user.AdminRewardVO;

@Service("adRewardService")
public class AdminRewardServiceImpl implements AdminRewardService {
	@Autowired
	private AdminRewardDAO adRewardDAO;
	
	@Override
	public int insertAdminReward(AdminRewardVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateAdminReward(AdminRewardVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAdminReward(AdminRewardVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public AdminRewardVO getAdReward(String category) {
		return adRewardDAO.searchPoint(category);
	}

	@Override
	public int getPerPoint(String category) {
		return adRewardDAO.perPoint(category);
	}



}

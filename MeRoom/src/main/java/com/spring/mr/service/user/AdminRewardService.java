package com.spring.mr.service.user;

import com.spring.mr.vo.user.AdminRewardVO;

public interface AdminRewardService {

	int insertAdminReward(AdminRewardVO vo);
	int updateAdminReward(AdminRewardVO vo);
	int deleteAdminReward(AdminRewardVO vo);
	AdminRewardVO getAdReward (String category);
	int getPerPoint(String category);
	
}

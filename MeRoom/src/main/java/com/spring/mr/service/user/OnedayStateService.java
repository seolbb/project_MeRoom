package com.spring.mr.service.user;

import java.util.List;

import com.spring.mr.vo.user.OnedayStateVO;

public interface OnedayStateService {
	
	OnedayStateVO getOnedayState(OnedayStateVO vo);
	List<OnedayStateVO> onedayStateList (String memberId);
	List<OnedayStateVO> lastOnedayStateList (String memberId);
	List<OnedayStateVO> cancelOnedayStateList(String memberId);
	int onedayStateCount(String memberId);
	int lastOnedayStateCount(String memberId);
	int cancelOnedayStateCount(String memberId);
}

package com.spring.mr.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mr.vo.user.OnedayStateVO;
@Service("onedayStateService")
public class OnedayStateServiceImpl implements OnedayStateService {
	@Autowired
	private OnedayStateDAO onedayStateDAO;
	
	@Override
	public OnedayStateVO getOnedayState(OnedayStateVO vo) {
		return onedayStateDAO.getOnedayState(vo);
	}

	@Override
	public List<OnedayStateVO> onedayStateList(String memberId) {
		return onedayStateDAO.onedayStateList(memberId);
	}

	@Override
	public List<OnedayStateVO> lastOnedayStateList(String memberId) {
		return onedayStateDAO.lastOnedayStateList(memberId);
	}

	@Override
	public List<OnedayStateVO> cancelOnedayStateList(String memberId) {
		return onedayStateDAO.cancelOnedayStateList(memberId);
	}

	@Override
	public int onedayStateCount(String memberId) {
		return onedayStateDAO.onedayStateCount(memberId);
	}

	@Override
	public int lastOnedayStateCount(String memberId) {
		return onedayStateDAO.lastOnedayStateCount(memberId);
	}

	@Override
	public int cancelOnedayStateCount(String memberId) {
		return onedayStateDAO.cancelOnedayStateCount(memberId);
	}

	


}

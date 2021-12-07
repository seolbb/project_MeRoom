package com.spring.mr.service.user;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mr.vo.user.OnedayStateVO;

@Repository
public class OnedayStateDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public OnedayStateVO getOnedayState(OnedayStateVO vo) {
		return mybatis.selectOne("onedayStateDAO.getOnedayState", vo);
	}
	
	public List<OnedayStateVO> onedayStateList(String memberId) {
		System.out.println("onedayStateList");
		System.out.println("memberId : " + memberId);
		return mybatis.selectList("onedayStateDAO.onedayStateList", memberId);
	}
	
	
	public List<OnedayStateVO> lastOnedayStateList(String memberId) {
		System.out.println("lastOnedayStateList");
		return mybatis.selectList("onedayStateDAO.lastOnedayStateList", memberId);
	}

	public List<OnedayStateVO> cancelOnedayStateList(String memberId) {
		System.out.println("cancelOnedayStateList");
		return mybatis.selectList("onedayStateDAO.cancelOnedayStateList", memberId);
	}
	
	public int onedayStateCount(String memberId) {
		System.out.println("onedayStateCount");
		System.out.println("유저아이디~~~:"+ memberId);
		return mybatis.selectOne("onedayStateDAO.onedayStateCount", memberId);
	}
	public int lastOnedayStateCount(String memberId) {
		System.out.println("lastOnedayStateCount");
		return mybatis.selectOne("onedayStateDAO.lastOnedayStateCount", memberId);
	}
	public int cancelOnedayStateCount(String memberId) {
		System.out.println("cancelOnedayStateCount");
		return mybatis.selectOne("onedayStateDAO.cancelOnedayStateCount", memberId);
	}
	
	
}

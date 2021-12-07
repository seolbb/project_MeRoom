package com.spring.mr.service.user;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mr.vo.user.RewardVO;
@Repository
public class RewardDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	// 리워드 적립
	public int insertReward(RewardVO vo) {
		System.out.println("insertReward() 메소드 실행");
		return mybatis.insert("rewardDAO.insertReward", vo);
	}
	
	// 리워드 리스트 조회
	public List<RewardVO> getRewardList(String memberId) {
		return mybatis.selectList("rewardDAO.getRewardList", memberId);
	}
	// 총 누적 적립금 금액
	public int totalReward(String memberId) {
		System.out.println("totalReward" + memberId);
		return mybatis.selectOne("rewardDAO.totalReward", memberId);
	}
	// 관리자용 전체 적립금 조회 - 최근날짜순
	public List<RewardVO> allRewardList() {
		return mybatis.selectList("rewardDAO.allRewardList");
	}
	// 관리자용 날짜별 리워드 삭제
	public int deleteDateRe(String reward_date) {
		return mybatis.delete("rewardDAO.deleteDateRe", reward_date);
	}
} 

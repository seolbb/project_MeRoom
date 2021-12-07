package com.spring.mr.service.user;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.spring.mr.vo.user.AdminRewardVO;

@Controller
public class AdminRewardDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	

	public AdminRewardVO searchPoint(String re_category) {
		System.out.println("searchPoint() >> 메소드 실행");
		return mybatis.selectOne("adRewardDAO.searchPoint", re_category);
	}
	public int perPoint(String category) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("adRewardDAO.perPoint", category);
	}
}

package com.spring.mr.service.user;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mr.vo.user.RoomStateVO;
@Repository
public class RoomStateDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public RoomStateVO getRoomState(RoomStateVO vo) {
		return mybatis.selectOne("roomStateDAO.getRoomState", vo);
	}
	
	public List<RoomStateVO> roomStateList(String memberId) {
		System.out.println("roomStateList");
		System.out.println("memberId : " + memberId);
		return mybatis.selectList("roomStateDAO.roomStateList", memberId);
	}
	
	
	public List<RoomStateVO> lastRoomStateList(String memberId) {
		System.out.println("lastRoomStateList");
		return mybatis.selectList("roomStateDAO.lastRoomStateList", memberId);
	}

	public List<RoomStateVO> cancelRoomStateList(String memberId) {
		System.out.println("cancelRoomStateList");
		return mybatis.selectList("roomStateDAO.cancelRoomStateList", memberId);
	}
	
	public List<RoomStateVO> reviewStateList(String memberId) {
		System.out.println("reviewStateList");
		return mybatis.selectList("roomStateDAO.reviewStateList", memberId);
	}
	
	public int roomStateCount(String memberId) {
		System.out.println("roomStateCount");
		return mybatis.selectOne("roomStateDAO.roomStateCount", memberId);
	}
	
	public int lastRoomStateCount(String memberId) {
		System.out.println("lastRoomStateCount");
		return mybatis.selectOne("roomStateDAO.lastRoomStateCount", memberId);
	}
	
	public int cancelRoomStateCount(String memberId) {
		System.out.println("cancelRoomStateCount");
		return mybatis.selectOne("roomStateDAO.cancelRoomStateCount", memberId);
	}
	
	
}

package com.spring.mr.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mr.vo.user.RewardVO;
import com.spring.mr.vo.user.RoomStateVO;

@Service("roomStateService")
public class RoomStateServiceImpl implements RoomStateService{
	@Autowired
	private RoomStateDAO roomStateDAO;

	public RoomStateServiceImpl() {
		System.out.println("RoomStateServiceImpl()  실행~~");
	}
	
	@Override
	public RoomStateVO getRoomState(RoomStateVO vo) {
		return roomStateDAO.getRoomState(vo);
	}

	@Override
	public List<RoomStateVO> roomStateList(String memberId) {
		System.out.println("roomList Impl");
		return roomStateDAO.roomStateList(memberId);
	}

	@Override
	public List<RoomStateVO> lastRoomStateList(String memberId) {
		return roomStateDAO.lastRoomStateList(memberId);
	}

	@Override
	public List<RoomStateVO> cancelRoomStateList(String memberId) {
		return roomStateDAO.cancelRoomStateList(memberId);
	}

	@Override
	public List<RoomStateVO> reviewStateList(String memberId) {
		return roomStateDAO.reviewStateList(memberId);
	}

	@Override
	public int roomStateCount(String memberId) {
		return roomStateDAO.roomStateCount(memberId);
	}

	@Override
	public int lastRoomStateCount(String memberId) {
		return roomStateDAO.lastRoomStateCount(memberId);
	}

	@Override
	public int cancelRoomStateCount(String memberId) {
		return roomStateDAO.cancelRoomStateCount(memberId);
	}

}

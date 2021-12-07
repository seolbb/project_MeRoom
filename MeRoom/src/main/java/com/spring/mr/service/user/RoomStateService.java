package com.spring.mr.service.user;

import java.util.List;

import com.spring.mr.vo.user.RoomStateVO;

public interface RoomStateService {
	
	RoomStateVO getRoomState(RoomStateVO vo);
	List<RoomStateVO> roomStateList (String memberId);
	List<RoomStateVO> lastRoomStateList (String memberId);
	List<RoomStateVO> cancelRoomStateList(String memberId);
	List<RoomStateVO> reviewStateList(String memberId);
	int roomStateCount (String memberId);
	int lastRoomStateCount(String memberId);
	int cancelRoomStateCount(String memberId);
}

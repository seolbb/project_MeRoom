package com.spring.mr.vo.reservation;

import java.util.List;
import java.util.Map;

public interface RoomService {
	
	
	void insertRoom(RoomVO vo);
	RoomVO getRoom(RoomVO vo);
	RoomVO getRoom(int number);
	List<RoomVO> getRoomList(RoomVO vo);
	
	List<RoomVO> getRoomInfo(Map<String, String> map);
	
	List<RoomVO> getRoomInfo(RoomVO vo);
	
	List<RoomVO> roomList();
	
	void UpdateRoom(RoomVO vo);
	
	void delete(int rmNumber);
	

	int roomsearch(String rmKind);
	
	String fileSearch(int rmNumber);
	
	
}

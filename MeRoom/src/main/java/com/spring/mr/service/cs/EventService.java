package com.spring.mr.service.cs;

import java.util.List;

import com.spring.mr.vo.cs.EventVO;

public interface EventService {
	
	//CRUD 기능 구현 메소드 정의
	void insertEvent(EventVO vo);
	void updateEvent(EventVO vo);
	void deleteEvent(EventVO vo);
	EventVO getEvent(EventVO vo);
	List<EventVO> getEventList();
	List<EventVO> getEventList(EventVO vo);
	
	
}

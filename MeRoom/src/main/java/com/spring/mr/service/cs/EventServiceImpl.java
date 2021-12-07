package com.spring.mr.service.cs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mr.vo.cs.EventVO;


// @Service : @Component 상속확장 어노테이션
// 		비즈니스 로직 처리 서비스 영역에 사용
@Service("EventService")
public class EventServiceImpl implements EventService{
	
	@Autowired // 타입이 일치하는 객체(인스턴스) 주입
	private EventDAO eventDAO;

	
	public EventServiceImpl() {
		System.out.println("EventServiceImpl() 객체 생성");
	}
	
	@Override
	public void insertEvent(EventVO vo) {
		eventDAO.insertEvent(vo);
		
	}

	@Override
	public void updateEvent(EventVO vo) {
		eventDAO.updateEvent(vo);
		
	}

	@Override
	public void deleteEvent(EventVO vo) {
		eventDAO.deleteEvent(vo);
		
	}

	@Override
	public EventVO getEvent(EventVO vo) {
		return eventDAO.getEvent(vo);
	}

	@Override
	public List<EventVO> getEventList() {
		return eventDAO.getEventList();
	}

	@Override
	public List<EventVO> getEventList(EventVO vo) {
		return eventDAO.getEventList(vo);
	}


	
	
	

}

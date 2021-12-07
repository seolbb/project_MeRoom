package com.spring.mr.service.cs;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mr.vo.cs.EventVO;



@Repository
public class EventDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public EventDAO() {
		System.out.println(">> EventDAOMybatis() 객체 생성");
	}

	// 글입력
	public void insertEvent(EventVO vo) {
		System.out.println("===> MyBatis로 insertEvent() 실행");
		mybatis.insert("eventDAO.insertEvent", vo);
	}

	// 글수정
	public void updateEvent(EventVO vo) {
		System.out.println("===> MyBatis로 updateEvent() 실행");
		mybatis.update("eventDAO.updateEvent", vo);
	}

	// 글삭제
	public void deleteEvent(EventVO vo) {
		System.out.println("===> MyBatis로 deleteEvent() 실행");
		mybatis.delete("eventDAO.deleteEvent", vo);
	}

	// 글 하나조회
	public EventVO getEvent(EventVO vo) {
		System.out.println("===> MyBatis로 getEvent() 실행");
		return mybatis.selectOne("eventDAO.getEvent", vo);
	}

	// 글 목록 조회
	
	public List<EventVO> getEventList() {
		System.out.println("===> MyBatis로 getEventList() 실행");
		return mybatis.selectList("eventDAO.getEventList");
	}
	
	
	public List<EventVO> getEventList(EventVO vo) {
		System.out.println("===> MyBatis로 getEventList() 실행");
		return mybatis.selectList("eventDAO.getEventList",vo);
	}


}

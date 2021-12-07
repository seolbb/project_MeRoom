package com.spring.mr.service.oneday;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mr.vo.oneday.OReservationVO;

@Repository
public class OReservationDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public OReservationDAO() {
		System.out.println(">> OReservationDAO() 객체 생성");
	}
	
	// 예약
	public void insertRsv(OReservationVO vo) {
		System.out.println("===> MyBatis로 insertRsv() 실행");
		mybatis.insert("oReservationDAO.insertRsv", vo);
	}

	public void deleteRsv() {
		System.out.println("===> MyBatis로 deleteRsv() 실행");
		mybatis.delete("oReservationDAO.deleteRsv");
	}
	
	public void deleteRsvVO(String orIdx) {
		System.out.println("===> MyBatis로 deleteRsv(vo) 실행");
		mybatis.delete("oReservationDAO.deleteRsvVO", orIdx);
	}

	public List<OReservationVO> getRsv(OReservationVO vo) {
		// TODO Auto-generated method stub
		return mybatis.selectList("oReservationDAO.getRsv",vo);
	}

	public List<OReservationVO> getRsvList(OReservationVO vo) {
		// TODO Auto-generated method stub
		return mybatis.selectList("oReservationDAO.getRsvList",vo);
	}

	public List<OReservationVO> getDayList(OReservationVO vo) {
		// TODO Auto-generated method stub
		return mybatis.selectList("oReservationDAO.getDayList",vo);
	}



}

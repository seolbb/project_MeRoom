package com.spring.mr.service.reservation;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mr.vo.reservation.RoomVO;

@Repository
public class RoomDAOMybatis {
	@Autowired
	private SqlSessionTemplate mybatis;
		
	public void insertRoom(RoomVO vo) {
		System.out.println("mybatis실행");
		//vo.setRmNumber("1263");
		mybatis.insert("roomDAO.insert",vo);
	}
	
	
	public RoomVO getRoom(RoomVO vo) {

		return mybatis.selectOne("roomDAO.getRoom",vo);
	}


	public List<RoomVO> getRoomList(RoomVO vo) {
		
		System.out.println("MYBATIS 실행");
	
		return mybatis.selectList("roomDAO.getRoomList",vo);
	}
	
	public List<RoomVO> getRoomInfo(Map<String, String> map) {
		
		return mybatis.selectList("roomDAO.getInfoMap",map);
	}
	
	public List<RoomVO> getRoomInfo(RoomVO vo) {
		
		System.out.println("MYBATIS 실행");
	
		return mybatis.selectList("roomDAO.getRoomInfo",vo);
	}
	
	
	public List<RoomVO> roomList(){
		System.out.println("MYBATIS 실행");
		return mybatis.selectList("roomDAO.roomList");
	}


	public void updateRoom(RoomVO vo) {
		System.out.println("MYBATIS 실행");
		mybatis.update("roomDAO.updateRoom",vo);
	}
	
	public RoomVO getRoom(int rmNumber) {

		return mybatis.selectOne("roomDAO.getRoomNumber",rmNumber);
	}


	public void delete(int rmNumber) {
		mybatis.delete("roomDAO.delete",rmNumber);
		
	}

	//룸 번호 가져오기
	public int roomsearch(String rmKind) {
		
		return mybatis.selectOne("roomDAO.roomsearch",rmKind);
	}


	public String serachFile(int rmNumber) {
		
		return mybatis.selectOne("roomDAO.serachFile",rmNumber);
	}
}

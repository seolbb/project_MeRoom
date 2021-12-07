package com.spring.mr.service.reservation;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mr.vo.reservation.ReservationVO;
import com.spring.mr.vo.user.UserVO;


@Repository
public class ReservationDAOMybatis {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insertReservation(ReservationVO vo){
		
		System.out.println("mybatis실행");
		return mybatis.insert("reservationDAO.reservationInsert",vo);
	}
	
	public void reserisDelete() {
		
		
		mybatis.delete("reservationDAO.reserDelete");
	}
	
	public List<ReservationVO> reserList(){
		
		return mybatis.selectList("reservationDAO.reserList");
	}

	public ReservationVO getReser(ReservationVO vo) {
		
		return mybatis.selectOne("reservationDAO.getReser",vo);
	}

	public void reserUpdate(ReservationVO vo) {
		
		mybatis.update("reservationDAO.reserUpdate",vo);
	}
	
	public void reserDelete(String rIdx) {
		mybatis.delete("reservationDAO.reserDel",rIdx);
	}

	public List<ReservationVO> roomReview(String kind) {
		System.out.println("mybatis kind" + kind);
		Map<String,String> map = new HashMap();
		map.put("kind", kind);
		
		
		System.out.println(map.get("kind"));
		return mybatis.selectList("reservationDAO.roomReview",map);
	}
	
	
	public List<ReservationVO> getUserReser(UserVO vo) {
		List<ReservationVO> userReserList = mybatis.selectList("reservationDAO.getUserReser",vo);
		System.out.println("DAO userReserList : " + userReserList);
		return userReserList;
	}
	
	public List<ReservationVO> reserList(ReservationVO vo){
		
		return mybatis.selectList("reservationDAO.reserList", vo);
	}
	
	
}

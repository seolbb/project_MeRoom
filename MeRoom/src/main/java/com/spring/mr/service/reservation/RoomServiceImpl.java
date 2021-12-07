package com.spring.mr.service.reservation;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mr.vo.reservation.ReservationVO;
import com.spring.mr.vo.reservation.RoomService;
import com.spring.mr.vo.reservation.RoomVO;

@Service("roomservice")
public class RoomServiceImpl implements RoomService{
	
	@Autowired
	private RoomDAOMybatis roomDAO;

	@Override
	public void insertRoom(RoomVO vo) {
		
		roomDAO.insertRoom(vo);
	}
	
	@Override
	public RoomVO getRoom(RoomVO vo) {
		System.out.println("Impl 실행!!!");
		
		return roomDAO.getRoom(vo);
	}

	@Override
	public List<RoomVO> getRoomList(RoomVO vo) {
		
		System.out.println("RoomDAO 실행");
		return roomDAO.getRoomList(vo);
	}

	@Override
	public List<RoomVO> getRoomInfo(RoomVO vo) {
		System.out.println("RoomDAOImpl 실행");
		return roomDAO.getRoomInfo(vo);
	}

	@Override
	public List<RoomVO> roomList() {
		
		return roomDAO.roomList();
	}

	@Override
	public void UpdateRoom(RoomVO vo) {

		roomDAO.updateRoom(vo);
		
	}

	@Override
	public RoomVO getRoom(int number) {
		
		return roomDAO.getRoom(number);
	}

	@Override
	public void delete(int rmNumber) {
		
		 roomDAO.delete(rmNumber);
	}

	@Override
	public List<RoomVO> getRoomInfo(Map<String, String> map){
		
		return roomDAO.getRoomInfo(map);
	}

	@Override
	public int roomsearch(String rmKind) {
		
		return roomDAO.roomsearch(rmKind);
	}

	@Override
	public String fileSearch(int rmNumber) {
		
		return roomDAO.serachFile(rmNumber);
	}



}

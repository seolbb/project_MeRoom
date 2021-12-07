package com.spring.mr.service.reservation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mr.vo.reservation.ReservationService;
import com.spring.mr.vo.reservation.ReservationVO;
import com.spring.mr.vo.user.UserVO;

@Service("reservationservice")
public class ReservationServiceImpl implements ReservationService{
	
	@Autowired
	private ReservationDAOMybatis reservationDAO;
	
	@Override
	public int insertReservation(ReservationVO vo) {
		System.out.println("Impl 실행~~");
		return reservationDAO.insertReservation(vo);
	}

	@Override
	public void reserIsDel() {
		reservationDAO.reserisDelete();
		
	}

	@Override
	public List<ReservationVO> reserList() {
		
		return reservationDAO.reserList();
	}

	@Override
	public ReservationVO getReser(ReservationVO vo) {
		return reservationDAO.getReser(vo);
	}

	@Override
	public void reserUpdate(ReservationVO vo) {
		
		reservationDAO.reserUpdate(vo);
	}

	@Override
	public void reserDelte(String rIdx) {
		reservationDAO.reserDelete(rIdx);
		
	}

	@Override
	public List<ReservationVO> roomReview(String kind) {
		
		return reservationDAO.roomReview(kind);
	}

	@Override
	public List<ReservationVO> reserList(ReservationVO vo) {
		return reservationDAO.reserList(vo);
	}

	@Override
	public List<ReservationVO> getUserReser(UserVO vo) {

		return reservationDAO.getUserReser(vo);
	}


	
}

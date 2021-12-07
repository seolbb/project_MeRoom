package com.spring.mr.vo.reservation;

import java.util.List;

import com.spring.mr.vo.user.UserVO;

public interface ReservationService {
	
	int insertReservation(ReservationVO vo);

	void reserIsDel();

	List<ReservationVO> reserList();
	
	List<ReservationVO> reserList(ReservationVO vo);
	
	ReservationVO getReser(ReservationVO vo);

	void reserUpdate(ReservationVO vo);

	void reserDelte(String rIdx);

	List<ReservationVO> roomReview(String kind);

	List<ReservationVO> getUserReser(UserVO vo);


}

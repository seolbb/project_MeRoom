package com.spring.mr.service.oneday;


import java.util.List;

import com.spring.mr.vo.oneday.OReservationVO;

public interface OReservationService {
	void insertRsv(OReservationVO vo);
	void deleteRsv();
	void deleteRsvVO(String orIdx);
	List<OReservationVO> getRsv(OReservationVO vo);
	List<OReservationVO> getRsvList(OReservationVO vo);
	List<OReservationVO> getDayList(OReservationVO vo);
}

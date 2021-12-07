package com.spring.mr.service.oneday;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mr.vo.oneday.OReservationVO;

@Service("oReservationService")
public class OReservationServiceImpl implements OReservationService {
	@Autowired
	private OReservationDAO rsvDAO;

	@Override
	public void insertRsv(OReservationVO vo) {
		rsvDAO.insertRsv(vo);
	}

	@Override
	public void deleteRsv() {
		rsvDAO.deleteRsv();
	}

	@Override
	public void deleteRsvVO(String orIdx) {
		rsvDAO.deleteRsvVO(orIdx);
	}

	@Override
	public List<OReservationVO> getRsv(OReservationVO vo) {
	
		return rsvDAO.getRsv(vo);
	}

	@Override
	public List<OReservationVO> getRsvList(OReservationVO vo) {
		// TODO Auto-generated method stub
		return rsvDAO.getRsvList(vo);
	}

	@Override
	public List<OReservationVO> getDayList(OReservationVO vo) {
		// TODO Auto-generated method stub
		return rsvDAO.getDayList(vo);
	}


}

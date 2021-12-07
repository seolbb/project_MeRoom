package com.spring.mr.service.place;

import java.util.List;

import com.spring.mr.vo.place.PlaceVO;

public interface PlaceService {
	// CRUD 기능 구현 메소드 정의
	void insertPlace(PlaceVO vo);
	void updatePlace(PlaceVO vo);
	void deletePlace(PlaceVO vo);
	PlaceVO getPlace(PlaceVO vo);
	List<PlaceVO> getPlaceList();
	List<PlaceVO> getPlaceList(PlaceVO vo);

}

package com.spring.mr.service.place;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mr.vo.place.PlaceVO;

@Service("placeService") // @Component 상속확장 어노테이션, 비즈니스 로직 처리 서비스 영역에 사용
public class PlaceServiceImpl implements PlaceService{
	
	@Autowired // 타입이 일치하는 객체(인스턴스)에 주입한다.
	private PlaceDAO placeDAO;
	
	public PlaceServiceImpl() {
		System.out.println(">> PlaceServiceImpl() 객체 생성");
	}
		
	
	@Override
	public void insertPlace(PlaceVO vo) {
		placeDAO.insertPlace(vo);
	}

	@Override
	public void updatePlace(PlaceVO vo) {
		placeDAO.updatetPlace(vo);
	}

	@Override
	public void deletePlace(PlaceVO vo) {
		placeDAO.deletePlace(vo);
	}

	@Override
	public PlaceVO getPlace(PlaceVO vo) {
		return placeDAO.getPlace(vo);
	}

	@Override
	public List<PlaceVO> getPlaceList() {
		return placeDAO.getPlaceList();
	}

	@Override
	public List<PlaceVO> getPlaceList(PlaceVO vo) {
		return placeDAO.getPlaceList(vo);
	}



}

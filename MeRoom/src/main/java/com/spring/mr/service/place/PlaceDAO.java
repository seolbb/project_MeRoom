package com.spring.mr.service.place;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mr.vo.place.PlaceVO;

@Repository
public class PlaceDAO {
	@Autowired // 타입이 일치하는 객체(인스턴스)에 주입한다.
	private SqlSessionTemplate mybatis;

	public PlaceDAO() {
		System.out.println("PlaceDAO 객체 생성");
	}

	// 입력
	public void insertPlace(PlaceVO vo) {
		System.out.println(">> MyBatis로 insertPlace() 실행");
		mybatis.insert("placeDAO.insertPlace", vo);
	}

	// 수정
	public void updatetPlace(PlaceVO vo) {
		System.out.println(">> MyBatis로 updatePlace() 실행");
		mybatis.update("placeDAO.updatePlace", vo);
	}

	// 삭제
	public void deletePlace(PlaceVO vo) {
		System.out.println(">> MyBatis로 deletePlace() 실행");
		mybatis.delete("placeDAO.deletePlace", vo);
	}

	// 한개 조회(상세조회)
	public PlaceVO getPlace(PlaceVO vo) {
		System.out.println(">> myBatis로  getPlace() 실행");
		return mybatis.selectOne("placeDAO.getPlace", vo);
	}
	
	// 전체 조회
	public List<PlaceVO> getPlaceList() {
		System.out.println(">> MyBatis로 getBoardList() 실행");
		return mybatis.selectList("placeDAO.getPlaceList"); 
	}
	
	public List<PlaceVO> getPlaceList(PlaceVO vo) {
		System.out.println(">> MyBatis로 getBoardList(vo) 실행");
		return mybatis.selectList("placeDAO.getPlaceList", vo); 
		
	}

}

package com.spring.mr.service.enjoy;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mr.vo.enjoy.EnjoyVO;
import com.spring.mr.vo.place.PlaceVO;

@Repository
public class EnjoyDAO {
	
	@Autowired // 타입이 일치하는 객체(인스턴스)에 주입한다.
	private SqlSessionTemplate mybatis;
	
	public EnjoyDAO() {
		System.out.println(">> EnjoyDAO 객체 생성");
	}
	
	// 입력
	public void insertEnjoy(EnjoyVO vo) {
		System.out.println(">> MyBatis로 insertEnjoy() 실행");
		mybatis.insert("enjoyDAO.insertEnjoy", vo);
	}
	
	// 수정
	public void updatetEnjoy(EnjoyVO vo) {
		System.out.println(">> MyBatis로 updateEnjoy() 실행");
		mybatis.update("enjoyDAO.updateEnjoy", vo);
	}

	// 삭제
	public void deleteEnjoy(EnjoyVO vo) {
		System.out.println(">> MyBatis로 deleteEnjoy() 실행");
		mybatis.delete("enjoyDAO.deleteEnjoy", vo);
	}
	
	// 상세조회
	public EnjoyVO getEnjoy(EnjoyVO vo) {
		System.out.println(">> MyBatis로 getEnjoy() 실행");
		return mybatis.selectOne("enjoyDAO.getEnjoy", vo); 
	}
	
	// 전체 조회
	public List<EnjoyVO> getEnjoyList() {
		System.out.println(">> MyBatis로 getEnjoy(vo) 실행");
		return mybatis.selectList("enjoyDAO.getEnjoyList");
	}
	
	// 전체 조회
	public List<EnjoyVO> getEnjoyList(EnjoyVO vo) {
		System.out.println(">> MyBatis로 getEnjoy(vo) 실행");
		return mybatis.selectList("enjoyDAO.getEnjoyList", vo);
	}

	// 음식 조회
	public List<EnjoyVO> getFoodsList() {
		System.out.println(">> MyBatis로 getFoodsList() 실행");
		return mybatis.selectList("enjoyDAO.getFoodsList");
	}

	// 기타부대시설 조회
	public List<EnjoyVO> getEntertainsList() {
		System.out.println(">> MyBatis로 getEntertainsList() 실행");
		return mybatis.selectList("enjoyDAO.getEntertainsList");
	}
	
	
	
}

package com.spring.mr.service.oneday;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mr.vo.oneday.OnedayClassVO;

@Repository
public class OnedayClassDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public OnedayClassDAO() {
		System.out.println(">> OnedayClassDAO() 객체 생성");
	}
	
	// 글입력
	public void insertClass(OnedayClassVO vo) {
		System.out.println("===> MyBatis로 insertClass() 실행");
		mybatis.insert("onedayClassDAO.insertClass", vo);
	}

	// 글수정
	public void updateClass(OnedayClassVO vo) {
		System.out.println("===> MyBatis로 updateClass() 실행");
		mybatis.update("onedayClassDAO.updateClass", vo);
	}
	
	// 글삭제
	public void deleteClass(OnedayClassVO vo) {
		System.out.println("===> MyBatis로 deleteClass() 실행");
		mybatis.delete("onedayClassDAO.deleteClass",vo);
	}
	
	// 글상세조회
	public OnedayClassVO getClass(OnedayClassVO vo) {
		System.out.println("===> MyBatis로 getClass() 실행");
		return mybatis.selectOne("onedayClassDAO.getClass", vo);
	}
	
	// 글전체목록
	public List<OnedayClassVO> getClassList(){
		System.out.println("===> MyBatis로 getClassList() 실행");
		return mybatis.selectList("onedayClassDAO.getClassList");
	}
	
	// 남은 수량 조회
	public String restCnt(Map<String, String> param) {
		System.out.println("===> MyBatis로 restCnt() 실행");
		return mybatis.selectOne("onedayClassDAO.restCnt", param);
	}
	
	

	
	
	

}

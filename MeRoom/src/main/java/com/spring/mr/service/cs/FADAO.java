package com.spring.mr.service.cs;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mr.vo.cs.FAVO;



@Repository
public class FADAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public FADAO() {
		System.out.println(">> FADAOMybatis() 객체 생성");
	}

	// 글입력
	public void insertFA(FAVO vo) {
		System.out.println("===> MyBatis로 insertFA() 실행");
		mybatis.insert("faDAO.insertFA", vo);
	}

	// 글수정
	public void updateFA(FAVO vo) {
		System.out.println("===> MyBatis로 updateFA() 실행");
		mybatis.update("faDAO.updateFA", vo);
	}

	// 글삭제
	public void deleteFA(FAVO vo) {
		System.out.println("===> MyBatis로 deleteFA() 실행");
		mybatis.delete("faDAO.deleteFA", vo);
	}

	// 글 하나조회
	public FAVO getFA(FAVO vo) {
		System.out.println("===> MyBatis로 getFA() 실행");
		return mybatis.selectOne("faDAO.getFA", vo);
	}

	// 글 목록 조회
	public List<FAVO> getFAList() {
		System.out.println("===> MyBatis로 getFAList() 실행");
		
		return mybatis.selectList("faDAO.getFAList2");
	}


}

package com.spring.mr.service.cs;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mr.vo.cs.AnswerVO;


@Repository
public class AnswerDAO {
	
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public AnswerDAO() {
		System.out.println("AnswerDAOMybatis() 객체 생성");
	}
	
	// 글입력
	public int insertAnswer(AnswerVO vo) {
		System.out.println("===> MyBatis로 insertAnswer () 실행");
		return mybatis.insert("answerDAO.insertAnswer", vo);
	}

	// 글수정
	public void updateAnswer (AnswerVO  vo) {
		System.out.println("===> MyBatis로 updateAnswer() 실행");
		mybatis.update("answerDAO.updateAnswer", vo);
	}

	// 글삭제
	public void deleteAnswer(AnswerVO  vo) {
		System.out.println("===> MyBatis로 deleteAnswer() 실행");
		mybatis.delete("answerDAO.deleteAnswer", vo);
	}

	// 글 하나조회
	public AnswerVO getAnswer(AnswerVO  vo) {
		System.out.println("===> MyBatis로 getAnswer() 실행" + vo);
		return mybatis.selectOne("answerDAO.getAnswer", vo);
		
	}

	// 글 목록 조회
	public List<AnswerVO> getAnswerList() {
		System.out.println("===> MyBatis로 getAnswerList() 실행");
		return  mybatis.selectList("answerDAO.getAnswerList");
	}

	public List<AnswerVO> getAnswerList(AnswerVO vo) {
		System.out.println("===> MyBatis로 getAnswerList(vo) 실행");
		return mybatis.selectList("answerDAO.getAnswerList", vo);
	}
	
	
}

package com.spring.mr.service.cs;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mr.vo.cs.QuestionVO;



@Repository
public class QuestionDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public QuestionDAO() {
		System.out.println(">> QuestionDAOMybatis() 객체 생성");
	}

	// 글입력
	public void insertQuestion(QuestionVO vo) {
		System.out.println("===> MyBatis로 insertQuestion() 실행");
		mybatis.insert("questionDAO.insertQuestion", vo);
	}

	// 글수정
	public void updateQuestion(QuestionVO vo) {
		System.out.println("===> MyBatis로 updateQuestion() 실행");
		mybatis.update("questionDAO.updateQuestion", vo);
	}

	// 글삭제
	public void deleteQuestion(QuestionVO vo) {
		System.out.println("===> MyBatis로 deleteQuestion() 실행");
		mybatis.delete("questionDAO.deleteQuestion", vo);
	}

	// 글 하나조회
	public QuestionVO getQuestion(QuestionVO vo) {
		System.out.println("===> MyBatis로 getQuestion() 실행");
		// vo.setqIdx(1);
		return mybatis.selectOne("questionDAO.getQuestion", vo);
	}

	// 글 목록 조회
	public List<QuestionVO > getQuestionList(QuestionVO  vo) {
		return mybatis.selectList("questionDAO.getQuestionList", vo);
	}
	
	
	public void updateQuestionStatus(QuestionVO vo) {
		System.out.println("답변 여부 DAO 실행");
		mybatis.update("questionDAO.updateQuestionStatus", vo);
	}
	
	// 유저 조회
	public List<QuestionVO > getQnaList(String  memberId) {
		return mybatis.selectList("questionDAO.getQnaList", memberId);
	}
	
	public List<QuestionVO> userQnaList(String  memberId) {
		return mybatis.selectList("questionDAO.userQnaList", memberId);
	}
}

package com.spring.mr.service.cs;

import java.util.List;

import com.spring.mr.vo.cs.QuestionVO;

public interface QuestionService {
	//CRUD 기능 구현 메소드 정의
	void insertQuestion(QuestionVO vo);
	void updateQuestion(QuestionVO  vo);
	void deleteQuestion(QuestionVO  vo);
	QuestionVO getQuestion(QuestionVO  vo);
	List<QuestionVO> getQuestionList(QuestionVO  vo);
	QuestionVO updateQuestionStatus(QuestionVO vo);
	List<QuestionVO> getQnaList(String memberId);
	List<QuestionVO> userQnaList(String memberId);
	
	
}

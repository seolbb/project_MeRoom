package com.spring.mr.service.cs;

import java.util.List;

import com.spring.mr.vo.cs.AnswerVO;


public interface AnswerService {
	//CRUD 기능 구현 메소드 정의
	int insertAnswer(AnswerVO vo);
	void updateAnswer(AnswerVO vo);
	void deleteAnswer(AnswerVO vo);
	AnswerVO getAnswer(AnswerVO vo);
	List<AnswerVO > getAnswerList();
	List<AnswerVO > getAnswerList(AnswerVO vo);
	
	
}

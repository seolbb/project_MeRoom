package com.spring.mr.service.cs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mr.vo.cs.QuestionVO;

@Service("questionService")
public class QuestionServiceimpl implements QuestionService{
	
	@Autowired
	private QuestionDAO questionDAO;
	
	
	public QuestionServiceimpl() {
		System.out.println("QuestionServiceimpl() 객체 생성");
	}


	@Override
	public void insertQuestion(QuestionVO vo) {
		questionDAO.insertQuestion(vo);
		
	}


	@Override
	public void updateQuestion(QuestionVO vo) {
		questionDAO.updateQuestion(vo);
		
	}


	@Override
	public void deleteQuestion(QuestionVO vo) {
		questionDAO.deleteQuestion(vo);
		
	}


	@Override
	public QuestionVO getQuestion(QuestionVO vo) {
		return questionDAO.getQuestion(vo);
	}

	@Override
	public List<QuestionVO> getQuestionList(QuestionVO vo) {
		List<QuestionVO> list = questionDAO.getQuestionList(vo);
		for (QuestionVO qvo : list) {
			String anyTyp = qvo.getAnyTyp();
			if (anyTyp.equals("room")) { qvo.setAnyTyp("객실정보"); }
			if (anyTyp.equals("reservation")) { qvo.setAnyTyp("예약문의"); }
			if (anyTyp.equals("oneday")) { qvo.setAnyTyp("원데이클래스"); }
			if (anyTyp.equals("place")) { qvo.setAnyTyp("주변정보"); }
			if (anyTyp.equals("other")) { qvo.setAnyTyp("기타문의"); }
			list.set(list.indexOf(qvo), qvo);
		}
		return list;
	}
	
	@Override
	public QuestionVO updateQuestionStatus(QuestionVO vo) {
		System.out.println("답변 여부 서비스 실행");
		questionDAO.updateQuestionStatus(vo);
		return null;
	}


	@Override
	public List<QuestionVO> getQnaList(String memberId) {
		return questionDAO.getQnaList(memberId);
	}



	@Override
	public List<QuestionVO> userQnaList(String memberId) {
		return questionDAO.userQnaList(memberId);
	}


}

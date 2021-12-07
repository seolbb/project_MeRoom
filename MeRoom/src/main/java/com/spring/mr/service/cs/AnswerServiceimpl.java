package com.spring.mr.service.cs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mr.service.cs.AnswerService;
import com.spring.mr.vo.cs.AnswerVO;

@Service("answerService")
public class AnswerServiceimpl implements AnswerService{

	@Autowired
	private AnswerDAO answerDAO;
	
	
	public AnswerServiceimpl() {
		System.out.println("AnswerServiceimpl() 객체 생성");
	}


	@Override
	public int insertAnswer(AnswerVO vo) {
		System.out.println("impl insertAnswer() 실행");
		return answerDAO.insertAnswer(vo);
	}


	@Override
	public void updateAnswer(AnswerVO vo) {
		answerDAO.updateAnswer(vo);
		
	}


	@Override
	public void deleteAnswer(AnswerVO vo) {
		answerDAO.deleteAnswer(vo);
		
	}


	@Override
	public AnswerVO getAnswer(AnswerVO vo) {
		return answerDAO.getAnswer(vo);
	}


	@Override
	public List<AnswerVO> getAnswerList() {
		return answerDAO.getAnswerList();
	}


	@Override
	public List<AnswerVO> getAnswerList(AnswerVO vo) {
		
		return answerDAO.getAnswerList(vo);
	}
	
	
	
	
	
}

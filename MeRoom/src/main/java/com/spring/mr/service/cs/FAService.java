package com.spring.mr.service.cs;

import java.util.List;

import com.spring.mr.vo.cs.FAVO;

public interface FAService {
	//CRUD 기능 구현 메소드 정의
	void insertFA(FAVO vo);
	void updateFA(FAVO vo);
	void deleteFA(FAVO vo);
	FAVO getFA(FAVO vo);
	List<FAVO> getFAList();
	
	
}

package com.spring.mr.service.enjoy;

import java.util.List;

import com.spring.mr.vo.enjoy.EnjoyVO;

public interface EnjoyService {
	// CRUD 기능 구현 메소드
	void insertEnjoy(EnjoyVO vo);
	void updateEnjoy(EnjoyVO vo);
	void deleteEnjoy(EnjoyVO vo);
	EnjoyVO getEnjoy(EnjoyVO vo);
	List<EnjoyVO> getEnjoyList();
	List<EnjoyVO> getEnjoyList(EnjoyVO vo);
	List<EnjoyVO> getFoodsList();
	List<EnjoyVO> getEntertainsList();
}

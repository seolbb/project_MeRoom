package com.spring.mr.service.cs;

import java.util.List;

import com.spring.mr.vo.cs.PromotionVO;

public interface PromotionService {
	
	//CRUD 기능 구현 메소드 정의
	void insertPromotion(PromotionVO vo);
	void updatePromotion(PromotionVO vo);
	void deletePromotion(PromotionVO vo);
	PromotionVO getPromotion(PromotionVO vo);
	List<PromotionVO> getPromotionList();
	List<PromotionVO> getPromotionList(PromotionVO vo);
	
	
}

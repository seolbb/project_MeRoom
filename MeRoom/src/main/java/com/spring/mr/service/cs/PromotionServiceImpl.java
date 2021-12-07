package com.spring.mr.service.cs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mr.vo.cs.NewsVO;
import com.spring.mr.vo.cs.PromotionVO;


// @Service : @Component 상속확장 어노테이션
// 		비즈니스 로직 처리 서비스 영역에 사용
@Service("PromotionService")
public class PromotionServiceImpl implements PromotionService {
	
	@Autowired // 타입이 일치하는 객체(인스턴스) 주입
	
	private PromotionDAO promotionDAO;

	public PromotionServiceImpl() {
		System.out.println("PromotionServiceImpl() 객체 생성");
		
	}
	
	@Override
	public void insertPromotion(PromotionVO vo) {
		promotionDAO.insertPromotion(vo);
		
	}

	@Override
	public void updatePromotion(PromotionVO vo) {
		promotionDAO.updatePromotion(vo);
	}

	@Override
	public void deletePromotion(PromotionVO vo) {
		promotionDAO.deletePromotion(vo);
		
	}

	@Override
	public PromotionVO getPromotion(PromotionVO vo) {
		return promotionDAO.getPromotion(vo);
		
	}

	@Override
	public List<PromotionVO> getPromotionList() {
		return promotionDAO.getPromotionList();
	}

	@Override
	public List<PromotionVO> getPromotionList(PromotionVO vo) {
		
		return promotionDAO.getPromotionList(vo);
	}

	
	
	

}

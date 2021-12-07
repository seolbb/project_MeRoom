package com.spring.mr.service.cs;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mr.vo.cs.PromotionVO;



@Repository
public class PromotionDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public PromotionDAO() {
		System.out.println(">> PromotionDAOMybatis() 객체 생성");
	}

	// 글입력
	public void insertPromotion(PromotionVO vo) {
		System.out.println("===> MyBatis로 insertPromotion() 실행");
		mybatis.insert("promotionDAO.insertPromotion", vo);
	}

	// 글수정
	public void updatePromotion(PromotionVO vo) {
		System.out.println("===> MyBatis로 updatePromotion() 실행");
		mybatis.update("promotionDAO.updatePromotion", vo);
	}

	// 글삭제
	public void deletePromotion(PromotionVO vo) {
		System.out.println("===> MyBatis로 deletePromotion() 실행");
		mybatis.delete("promotionDAO.deletePromotion", vo);
	}

	// 글 하나조회
	public PromotionVO getPromotion(PromotionVO vo) {
		System.out.println("===> MyBatis로 getPromotion() 실행");
		return mybatis.selectOne("promotionDAO.getPromotion", vo);
	}

	
	public List<PromotionVO> getPromotionList() {
		System.out.println("===> MyBatis로 getPromotionList() 실행");
		return mybatis.selectList("promotionDAO.getPromotionList");
	}
	// 글 목록 조회
	public List<PromotionVO> getPromotionList(PromotionVO vo) {
		System.out.println("===> MyBatis로 getPromotionList() 실행");
		return mybatis.selectList("promotionDAO.getPromotionList",vo);
	}


}

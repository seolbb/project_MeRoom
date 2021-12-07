package com.spring.mr.service.user;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mr.vo.user.ReviewVO;

@Repository
public class ReviewDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	public int insertReview (ReviewVO vo) {
		
		System.out.println("ReviewDAO");
		return mybatis.insert("reviewDAO.insertReview", vo);
	}
	
	public int updateReview (ReviewVO vo) {
		return mybatis.update("reviewDAO.updateReview", vo);
	}
	
	public int deleteReview (ReviewVO vo) {
		return mybatis.delete("reviewDAO.deleteReview", vo);
	}
	
	public ReviewVO getReview (ReviewVO vo) {
		return mybatis.selectOne("reviewDAO.getReview", vo);
	}
	
	public List<ReviewVO> getReviewList (ReviewVO vo) {
		System.out.println("getReviewList DAO vo" + vo);
		return mybatis.selectList("reviewDAO.getReviewList", vo);
	}
	
	public List<ReviewVO> reviewList() {
		return mybatis.selectList("reviewDAO.reviewList");
	}
	
	public List<ReviewVO> userReviewList(String memberId) {
		return mybatis.selectList("reviewDAO.userReviewList", memberId);
	}
	
}

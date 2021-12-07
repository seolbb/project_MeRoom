package com.spring.mr.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mr.vo.user.ReviewVO;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService{
	@Autowired
	private ReviewDAO reviewDAO;
	
	@Override
	public int insertReview(ReviewVO vo) {
		System.out.println("ReviewServiceImpl ");
		return reviewDAO.insertReview(vo);
	}

	@Override
	public int updateReview(ReviewVO vo) {
		return reviewDAO.updateReview(vo);
	}

	@Override
	public int deleteReview(ReviewVO vo) {
		return reviewDAO.deleteReview(vo);
	}

	@Override
	public ReviewVO getReview(ReviewVO vo) {
		return reviewDAO.getReview(vo);
	}

	@Override
	public List<ReviewVO> getReviewList(ReviewVO vo) {
		return reviewDAO.getReviewList(vo);
	}

	@Override
	public List<ReviewVO> reviewList() {
		return reviewDAO.reviewList();
	}

	@Override
	public List<ReviewVO> userReviewList(String memberId) {
		return reviewDAO.userReviewList(memberId);
	}

	
	
	
}

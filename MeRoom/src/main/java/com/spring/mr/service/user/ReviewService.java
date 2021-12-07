package com.spring.mr.service.user;

import java.util.List;

import com.spring.mr.vo.user.ReviewVO;

public interface ReviewService {
	
	int insertReview (ReviewVO vo);
	int updateReview (ReviewVO vo);
	int deleteReview (ReviewVO vo);
	ReviewVO getReview (ReviewVO vo); // 리뷰 1개 조회
	List<ReviewVO> getReviewList (ReviewVO vo); // 유저의 전체리뷰 리스트
	List<ReviewVO> reviewList (); // 전체리뷰 리스트
	List<ReviewVO> userReviewList (String memberId); // 2개 조회
	
}

package com.spring.mr.service.cs;

import java.util.List;

import com.spring.mr.vo.cs.NewsVO;

public interface NewsService {
	//CRUD 기능 구현 메소드 정의
	void insertNews(NewsVO vo);
	void updateNews(NewsVO vo);
	void deleteNews(NewsVO vo);
	NewsVO getNews(NewsVO vo);
	List<NewsVO> getNewsList();
	List<NewsVO> getNewsList(NewsVO vo);
	
	
}

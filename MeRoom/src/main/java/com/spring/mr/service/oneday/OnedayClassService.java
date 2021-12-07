package com.spring.mr.service.oneday;

import java.util.List;
import java.util.Map;

import com.spring.mr.vo.oneday.OnedayClassVO;

public interface OnedayClassService {
	void insertClass(OnedayClassVO vo);
	void updateClass(OnedayClassVO vo);
	void deleteClass(OnedayClassVO vo);
	OnedayClassVO getClass(OnedayClassVO vo);
	List<OnedayClassVO> getClassList();
	String restCnt(Map<String, String> param);

}
